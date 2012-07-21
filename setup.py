# This is only for building Windows binaries, really. If you're on OSX/Linux
# you should probably just run "python naoko.py"

import sys, traceback
try:
   from cx_Freeze import setup, Executable
except:
   traceback.print_exc()
   sys.stderr.write("\nBuilding a windows executable requires cx_Freeze\n")
   exit(-1)

build_exe_options = {"includes": ["hashlib", "naoko"], "packages": ["naoko", "naoko.lib"], "include_files": ["naoko.conf", "naoko.sql"]}

setup(
   name = "naoko",
   version = "1.0",
   description = "A Synchtube bot",
   options = {"build_exe": build_exe_options},
   executables = [Executable("naoko.py", path="naoko")]
)
