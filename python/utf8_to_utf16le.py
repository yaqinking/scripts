'''
Convert UTF-8 file encoding files to UTF-16 LE encoding files.

supprot file ext .txt .ks .tjs

'''

from pathlib import Path

p = Path('.')

txts  = list(p.glob('*.txt'))
kss   = list(p.glob('*.ks'))
tjss  = list(p.glob('*.tjs'))

process_files = txts + kss + tjss

out_path = Path('out_utf16le')

exist = out_path.exists()
if not exist:
    out_path.mkdir()

for file_name in process_files:
    rf = open(file_name, 'r', -1, 'utf8')
    out_filename = out_path/file_name
    wf = open(out_filename, 'w', -1, 'utf-16le')
    wf.write('\ufeff')
    wf.write(rf.read())
    wf.close()
    rf.close()
    log = '{0}/{1} converted.'.format(out_path, file_name)
    print(log)
