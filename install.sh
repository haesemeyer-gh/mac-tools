#!/bin/bash
# this script needs to be run with admin permissions
# dependencies: osacompile

echo "creating temporary build directory"
mkdir -p ./build/
pushd ./build/

echo "installing applescript tools"
for file in ../applescript/*; do
	if [ -f "${file}" ]; then

		# new file name is first comment of file stripped of non-[:alpha:] characters.
		TMP_MACTOOLS_NEWFILENAME=$(head -n 1 "${file}" | sed 's/[^[:alpha:]]//g')
		TMP_MACTOOLS_NEWPATH="/Applications" # install to /Applications
		TMP_MACTOOLS_NEWFILE="${TMP_MACTOOLS_NEWFILENAME}.app"
		TMP_MACTOOLS_NEWAPP="${TMP_MACTOOLS_NEWPATH}/${TMP_MACTOOLS_NEWFILE}"

		echo "compiling script \`${file}\`"
		osacompile -l AppleScript -o "${TMP_MACTOOLS_NEWFILE}" "${file}"

		echo "removing old version if exists"
		sudo rm -rf "${TMP_MACTOOLS_NEWAPP}"

		echo "moving application and setting permissions"
		chmod -vv 0755 "${TMP_MACTOOLS_NEWFILE}"
		sudo mv -v "${TMP_MACTOOLS_NEWFILE}" "${TMP_MACTOOLS_NEWAPP}"
		chmod -vv 0555 "${TMP_MACTOOLS_NEWAPP}"

	fi
done

echo "removing temporary build files"
popd
rm -rf ./build/

