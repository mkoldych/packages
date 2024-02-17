#!/usr/bin/env python3
 
import subprocess
import json
from pathlib import Path
from pprint import pprint as pp
 
lib_dirs_abs = [
        '/usr/include',
        ]
 
lib_dirs_rel = [
        "inc",
        ]
 
comp_dirs = [
        'l2vpn',
       ]
 
clean_dirs = comp_dirs

global_defines = {
        "__ENUM_DEFINE_LINUX__" : "1",
        }
 
cmd = ['rm', '-r', '.ccls-cache', '.ccls']
print('\nRUN: ' + ' '.join(cmd))
out = subprocess.Popen(cmd).communicate()
 
for comp in clean_dirs:
    cmd = ['rm', '-r', f'{comp}/.ccls-cache', f'{comp}/.ccls']
    print('\nRUN: ' + ' '.join(cmd))
    out = subprocess.Popen(cmd).communicate()
 
 
ccls_header = '''\
clang
%c -std=c23
%cpp -std=c++2a
%h
'''
 
ccls_defines = ''
for d,v in global_defines.items():
    if len(v) > 0:
        d = d + f"={v}"
    ccls_defines += f"-D{d}\n"
 
for comp in comp_dirs:
    cmd = []
    cmd.append('find')
    cmd.append(comp)
    cmd.append('-type')
    cmd.append('d')
    out = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()
    src_dirs = out[0].decode().split('\n')
 
    depth = comp.count("/") + 1
    ccls_lib_includes = ''
    for src_dir in lib_dirs_rel:
        ccls_lib_includes += "-I" + "../"*depth + src_dir + "\n"
    for src_dir in lib_dirs_abs:
        ccls_lib_includes += '-I%s\n' % (src_dir)
 
    ccls_comp_includes = ''
    for src_dir in src_dirs:
        if len(src_dir) == 0:
            continue
        src_dir = src_dir[len(comp)+1:]
        ccls_comp_includes += '-I./%s\n' % (src_dir)
 
    ccls_content = ccls_header + ccls_defines + ccls_lib_includes + ccls_comp_includes
    with open(f'{comp}/.ccls', 'w') as f: f.write(ccls_content)
    print(f"COMP {comp}/.ccls:\n")
    print(ccls_content)
    print("\n")
 
index_dict = {
        'index.multiVersion' : 1,
        }
init_dict = {
        'index' : index_dict,
        }