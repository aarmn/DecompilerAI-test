#!/usr/bin/env just --justfile
# !/usr/bin/env -S just --justfile

# set dotenv-load
# set export
# set windows-shell := ...
# set positional-arguments
# set shell := ["nu", "-c"]
# arch, num_cpus(), os(), os_family(), env(key), env(key, default), invocation_directory(), justfile(), justfile_directory(), just_executable(),  
# error(message), hashings, uuid(), semver_matches(version, requirement), 
# [no-cd] [linux] [macos] [confirm("prompt")] [unix] [windows]
# export a
# [unix]
# run:
#   cc main.c
#   ./a.out
# [windows]
# run:
#   cl main.c
#   main.exe

# [no-cd]
# commit file:
#   git add {{file}}
#   git commit

# localhost := `dumpinterfaces | cut -d: -f2 | sed 's/\/.*//' | sed 's/ //g'`

# serve:
#   ./serve {{localhost}} 8080

# just os=plan9

# foo := if "2" == "2" { "Good!" } else { "1984" }
# foo := if "hello" =~ 'hel+o' { "match" } else { "mismatch" }
# foo := if "hello" != "goodbye" { "xyz" } else { "abc" }

# default: (build "main")
# build target:
#   @echo 'Building {{target}}…'
#   cd {{target}} && make

# python:
#   #!/usr/bin/env python3
#   print('Hello from python!')

# _test-helper:
#   ./bin/super-secret-test-helper-stuff

# @quiet:
#   echo hello
#   echo goodbye
#   @# all done!

alias setup := install-dependency

# shows available commands
default:
  just --list --justfile {{justfile()}} 

# runs an MVP of the project, pass a simple ELF file and get a simple output
mvp : install-dependency
  for path in `ls examples`; do echo "\nAnalyzing $path \n"; python3 FSC.py "${path}/main.o" > temp; diff main.c temp; done
  rm temp
  # clang-format, tooling, reload of FSC loadings move to python maybe?

# run elf: install-dependency
#   for path in `ls examples`;
#   do
#     echo "\nAnalyzing $path \n"
#     python3 FSC.py "${path}/main.o"
#   done

# installs dependencies
install-dependency:
  python3 -m pip install -r requirements.txt

#
publish:

#
test: install-dependency

build-examples:
  for path in `ls examples`; do gcc -c ./examples/$path/main.c -o ./examples/$path/main.o ; done # && ld ./examples/$path/main.o -o ./examples/$path/main

clean-examples:
  for path in `ls examples`; do rm ./examples/$path/main.o ; done

# makeall examples