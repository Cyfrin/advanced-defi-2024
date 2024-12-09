import os
import sys
import subprocess
import json
import datetime

def get_video_duration(file_path):
    std_out = subprocess.check_output(
        f'ffprobe -v quiet -show_streams -select_streams v:0 -of json "{file_path}"',
        shell=True
    ).decode()

    json_data = json.loads(std_out)['streams'][0]

    duration = json_data["duration"]
    return float(duration)


### main script ###
# python video_durations.py relative/path/to/folder/with/videos

target_path = sys.argv[1]
script_path = os.path.dirname(os.path.abspath(sys.argv[0])) 
abs_path = os.path.join(script_path, target_path)

print(abs_path)

files = os.listdir(abs_path)
files.sort()

total_sec = 0
videos = []

for f in files:
    abs_f_path = os.path.join(abs_path, f)
    if os.path.isfile(abs_f_path):
        dur = get_video_duration(abs_f_path)

        timestamp = datetime.timedelta(seconds = round(total_sec))
        dt = datetime.timedelta(seconds = round(dur))
        print(timestamp, f, dt)

        # Update total_sec after printing timestamp
        total_sec += dur
        videos.append({ 
            "file_name": f, 
            "seconds": dur,
            "total": total_sec,
        })

print("videos:", len(videos))
print("total:", datetime.timedelta(seconds = round(total_sec)))
