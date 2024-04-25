# basherer
Another Bash Shell Script Framework

## Installation

```bash
cd $HOME
wget https://raw.githubusercontent.com/DaniTeleco/basherer/main/basherer.sh
mv basherer.sh .basherer.sh
chmod 755 $HOME/.basherer.sh
```
If you prefer to download in a different path:

```bash
ln -s /route/to/your/file/basherer.sh $HOME/.basherer.sh
```

## Usage
Include the next lines at the beggining of your scripts:

### Local usage per script
```bash
#!/bin/bash
source $HOME/.basherer.sh "$@"
bs_initialEnvironmentsSetup "$@"                    					# [Optional]
bs_setExecutionPathSecure "/some/path/you/need/to/be/sure/command/has/to/be/executed/in"	# [Optional]
bs_checkExecutionPathSecure "$@"                    					# [Optional]
```

### Global usage

```bash
echo "source $HOME/.basherer.sh \"$@\"" >> $HOME\.bashrc
```
