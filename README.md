# tmt-deploy

This project contains scripts to fetch and run the executable artifacts for csw-services and ocs-gateway.
All of these scripts are to be run from the base directory of the project.
  
## Scripts
Scripts to be used directly by the user
* csw-bootstrap.sh 
* esw-bootstrap.sh
* csw-services.sh

## Running the bootstrap scripts 

Bootstrap scripts are used to fetch the executable artifacts for 
[csw](https://github.com/tmtsoftware/csw) project and
[esw-prototype](https://github.com/tmtsoftware/esw-prototype) project.

Script expects a specific version of the project to generate and fetch respective executables using Jitpack.

#### csw-bootstrap.sh
Generating executable against a sha of git commit. Used to get the changes already checked-into git.
```sbtshell
./scripts/csw-bootstrap.sh 235aa5852
```
Generating executable against a project version. Used to get the changes published locally.
```sbtshell
./scripts/csw-bootstrap.sh 0.1-SNAPSHOT
```

#### esw-bootstrap.sh
Similarly, we can get artifacts for esw-prototype
```sbtshell
./scripts/esw-bootstrap.sh cfa9197e68
```
```sbtshell
./scripts/esw-bootstrap.sh 0.1.0-SNAPSHOT
```

## Running csw services
After running the csw-bootstrap.sh script, we can run the csw services by using the generated artifacts.

#### csw-services.sh
Generating executable against a sha of git commit. Used to get the changes already checked-into git.

Assuming the version used to generate the artifacts is `235aa5852` and we are running the services for the first time.
```sbtshell
./target/csw/235aa5852/bin/csw-services.sh  start -i en0 --initRepo
```
Once initializing repo for config service is complete, we can simply use. 
```sbtshell
./target/csw/235aa5852/bin/csw-services.sh  start -i en0
```
Stopping the services
```sbtshell
./target/csw/235aa5852/bin/csw-services.sh  stop
```

## Running ocs gateway
After running the esw-bootstrap.sh script, we can run the esw gateway by using the generated artifact.
Assuming version used with esw-bootstrap.sh is `cfa9197e68`
```sbtshell
./target/esw/cfa9197e68/bin/ocs-gateway
```
Default port for gateway is 9090 you can override it 
e.g.
```sbtshell
./target/esw/cfa9197e68/bin/ocs-gateway 9000
```
