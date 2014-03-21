# Ccg

A command-line tool suite for working with digital objects 
created by the NYU DLTS Content Creation Group (CCG).


## Current Status

### *UNDER DEVELOPMENT*


## Usage

##### command syntax:
```
$ ccg <digital object type> <command> <options> path/to/digital/object/directory
```

##### Help is available from the command line:
```
$ ccg
Commands:
  ccg help [COMMAND]   # Describe available commands or one specific command
  ccg text SUBCOMMAND  # Look and Feel Text commands

$ ccg text help
Commands:
  ccg text check d, --dir=DIR p, --prefix=PREFIX      # check filenames to see if they comply with known patterns
  ccg text fix_names d, --dir=DIR p, --prefix=PREFIX  # bulk filename correction from known patterns to canonical pattern
  ccg text help [COMMAND]                             # Describe subcommands or one specific subcommand

Options:
  [--verbose]  
  [--noop]     
```


## Examples

##### Definitions:
  * INVALID directory: a directory in which some file names are NOT RECOGNIZED
  * RECOGNIZED directory: a directory in which all file names are RECOGNIZED and can be NORMALIZED
  * NORMALIZED directory: a directory in which all file names have been NORMALIZED

##### run ```check``` command on an INVALID directory
```
$ ccg text check -d /Volumes/drv/cap1_ref132 -p cap1_ref132 
/Volumes/drv/cap1_ref132 : ERROR: UNRECOGNIZED FILES DETECTED:
/Volumes/drv/cap1_ref132 : ERROR: /Volumes/drv/cap1_ref132/.DS_Store
/Volumes/drv/cap1_ref132 : ERROR: /Volumes/drv/cap1_ref132/cap1_ref132_jpeg
/Volumes/drv/cap1_ref132 : ERROR: /Volumes/drv/cap1_ref132/deriv
```

##### run ```check``` command on a RECOGNIZED directory 
```
$ ccg text check -d /Volumes/drv/cap1_ref132/deriv -p cap1_ref132
/Volumes/drv/cap1_ref132/deriv All filenames recognized, but some filenames are not conformant. Rename is possible.
$ 
```

##### run ```fix_names``` command on a RECOGNIZED directory
```
$ ccg text fix_names -d /Volumes/drv/cap1_ref132/deriv -p cap1_ref132 --verbose
-------------------------------------------------------------------------------
RENAME PLAN
-------------------------------------------------------------------------------
        cap1_ref132-fr01_m.tif   ->          cap1_ref132_afr01_m.tif
        cap1_ref132-fr02_m.tif   ->          cap1_ref132_afr02_m.tif
...
        cap1_ref132_bk01_m.tif   ->          cap1_ref132_zbk01_m.tif
        cap1_ref132_bk02_m.tif   ->          cap1_ref132_zbk02_m.tif
-------------------------------------------------------------------------------
Do you want to continue with rename operation?
(anything by Y aborts operation):
y
mv /Volumes/drv/cap1_ref132/deriv/cap1_ref132-fr01_m.tif /Volumes/drv/cap1_ref132/deriv/cap1_ref132_afr01_m.tif
mv /Volumes/drv/cap1_ref132/deriv/cap1_ref132-fr02_m.tif /Volumes/drv/cap1_ref132/deriv/cap1_ref132_afr02_m.tif
...
mv /Volumes/drv/cap1_ref132/deriv/cap1_ref132_bk01_m.tif /Volumes/drv/cap1_ref132/deriv/cap1_ref132_zbk01_m.tif
mv /Volumes/drv/cap1_ref132/deriv/cap1_ref132_bk02_m.tif /Volumes/drv/cap1_ref132/deriv/cap1_ref132_zbk02_m.tif

RENAME OPERATION COMPLETE
thank you for using /Users/DLTS1/.rvm/gems/ruby-1.9.3-p448@ccg/bin/ccg 
goodbye...
-------------------------------------------------------------------------------
$

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
