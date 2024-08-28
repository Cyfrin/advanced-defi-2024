const path = require("path")
const assert = require("assert")
const fs = require("fs")

function padd(s, c, n) {
  return `${c.repeat(n)}${s}`.slice(-n)
}

function walk(root, f) {
  let q = [root]

  while (q.length > 0) {
    const node = q.pop()
    const file_paths = fs.readdirSync(node)

    for (const file_path of file_paths) {
      let p = path.join(node, file_path)
      if (fs.lstatSync(p).isDirectory()) {
        q.push(p)
      } else {
        f(p)
      }
    }
  }
}

// Script to flatten videos
// node rename.js amm/uniswap-v2 uni-v2-flat
async function main() {
  const args = process.argv.slice(2)
  // relative path to src and dst
  const src = args[0]
  const dst = args[1]

  assert(src, "missing path")
  assert(dst, "missing path")
  assert(src != dst, "src = dst")

  const abs_src = path.join(__dirname, src)
  const abs_dst = path.join(__dirname, dst)

  assert(fs.readdirSync(abs_dst).length == 0, `${dst} not empty`)

  file_paths = []
  walk(abs_src, file_path => file_paths.push(file_path))

  file_paths.sort()

  // Filter out file ending with -raw or -noise
  const regex = /-(raw|noise)\./;
  let j = 1;
  for (let i = 0; i < file_paths.length; i++) {
    const f = file_paths[i]
    const parts = f.split("/")
    const last = parts[parts.length - 1]
    if (regex.test(last)) {
      continue
    }

    const new_file_name = `${padd(j, "0", 3)}-${last}`
    const dst_path = path.join(abs_dst, new_file_name)
    j += 1;

    fs.copyFileSync(f, dst_path)
    console.log(dst_path)
  }
}

main()
