# Example #4

This installer contains examples for the following features:

- Registry manipulation (and how to delete entries via the uninstaller)
  - This is used to detect previous installations/the previous install directory for easy upgrades
- Automatic uninstall call before installation when previous version was detected via the registry
- Environment variable manipulation (and how to delete created entries via the uninstaller)
  - This is used to make certain files available in all terminals
- Adding other resource files and unpacking them to another directory than the install directory
- Creating program shortcuts with icons to executables or directories
- Including a LICENSE text file
- Dumping the logs of the installation into a file (that is per default located in the user temp directory so it will be removed automatically down the line)
- Custom multi language strings with fallbacks
