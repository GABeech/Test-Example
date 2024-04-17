# Helper Scripts

I like to see build and deploy scripts in a seperate top level folder. Having the logic in a seperate script from the CI/CD definition
allows for easier local testing, and updating of the build steps.

I also like to see some defensive programming - checking that all the information that is needed exists before executing commands. Exiting early with good feedback
to the person running the script.

I also like to see the use of different exit codes when checking for errors, and issues.

