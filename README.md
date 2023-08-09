# shellscript-collection

A collection of small, useful and powerful shell scripts.

## Description

Please use it as a reference or quote it when writing shell scripts on a daily basis.  

For detailed instructions on how to use each of these,  
please see the header in the shell script.

## Getting Started

### Dependencies

- Almost all Linux distributions
- bash version 4.0+

For reference,the author uses the following environment.
- WSL2 Ubuntu 20.04.5 LTS
- bash 5.0.17

### Installing

* Temporary path addition
```
$ git clone https://github.com/Lamaglama39/shellscript-collection.git
$ cd shellscript-collection/<directory to used>
$ export PATH=$PATH:$(pwd)
```

* Adding a path to a configuration file
```
$ git clone https://github.com/Lamaglama39/shellscript-collection.git
$ cd shellscript-collection/<directory to used>
$ printf '# shell path\nexport PATH=\"$PATH:'"$(pwd)"\"'\n' >> ~/.bashrc
```

## Project Structure
```
.
├── LICENSE.md
├── README.md
├── cheatsheet     # Cheat sheet for various commands.
├── cloud          # Wrapper scripts for cloud provider CLI.
│   ├── aws
│   └── gcp
├── joke           # Funny joke script.
├── script-parts   # Reusable parts of a script.
│   ├── checker    # Syntax check.
│   └── templat    # Syntax template.
└── tools          # Common command line tools.
    ├── conversion # Tools for image format conversion, QR generation, etc.
    ├── math       # Mathematical Tools.
    └── utils      # Versatile command line tool.
```

## Author

[@Lamaglama39](https://twitter.com/lamaglama39)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
