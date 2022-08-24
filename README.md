# NsiWindowsInstallerExamples

In this repository you will find some cool and easy to understand NSI script templates with which you can install for example Windows Programs with an additional uninstaller, License that needs to be accepted, use Multilanguage, add a different components chooser and more - all without needing to program any of this, just using one simple NSI script file.

## How to create an `installer.exe`?

First you need to download the newest version of the **N**ullsoft **S**criptable **I**nstall **S**ystem program/compiler:

- You find it here: [http://nsis.sourceforge.net/Download](http://nsis.sourceforge.net/Download)
- Or you can install it via winget: `winget install NSIS.NSIS`

If you want to use it via a command line interface make sure that the binary directory has an entry in your environment variable PATH (the default should be `C:\Program Files (x86)\NSIS\Bin`) - make sure to restart your terminal after adding it so it will be recognized.

---

For some installers you need NSIS plugins which means you need to download a NSIS plugin and extract it to the NSIS directory which should per default be located in `C:\Program Files (x86)\NSIS` on Windows and in `/usr/share/nsis` on Linux.
It depends on the Plugin but the only plugin that was used in this directory has extracted a `Contrib` and `Plugins` directory which is why you need to extract it in the top level directory, for other plugins your mileage may vary and you can extract it directly into the `Plugins` directory.

---

All scripts were tested on Windows and Linux (via WSL) so they should work cross platform.

### GUI

1. Start NSIS
2. Click under the section **Compiler** the entry **Compile NSI scripts**
3. On the new window click **File** in the menu bar and click **Load Script**
4. Select your written script and click **Open**
5. The `installer.exe` (or however you named it) will instantly (after 2-15 seconds) be compiled and ready
6. Over the button **Test Installer** you can even instantly test it

### CLI

1. Run `makensis script.nsi`

## Further examples, Documentation?

I am not the maker of this thing and just read some websites an *learned* it.

The official documentation can be found here:

* [NSIS Users Manual](http://nsis.sourceforge.net/Docs/)
* [NSIS Modern User Interface Manual](http://nsis.sourceforge.net/Docs/Modern%20UI%202/Readme.html)
* [Official NSI Modern UI Examples](http://nsis.sourceforge.net/Examples/Modern%20UI/)
* [Official Even More NSI Examples](http://nsis.sourceforge.net/Examples/)
