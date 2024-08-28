const path = require("path")
const assert = require("assert")
const fs = require("fs")

function padd(s, c, n) {
  return `${c.repeat(n)}${s}`.slice(-n)
}

// Script to rename number prefix
// node rename.js section-02-swap/ 0
async function main() {
  const args = process.argv.slice(2)
  const relative_path = args[0]
  const offset = parseInt(args[1])

  assert(relative_path, "missing path")
  assert(offset >= 0, `invalid offset`)

  const base_path = path.join(__dirname, relative_path)
  const files = fs.readdirSync(base_path)
  for (let i = 0; i < files.length; i++) {
    const file = files[i]
    let [num, ...rest] = file.split("-")
    num = parseInt(num)
    assert(num >= offset)

    const prefix = padd(num - offset, "0", 2)
    const new_file_name = `${prefix}-${rest.join("-")}`
    fs.renameSync(
      path.join(base_path, file),
      path.join(base_path, new_file_name)
    )
    console.log(new_file_name)
  }
}

main()
