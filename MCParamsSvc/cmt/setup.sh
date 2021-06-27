# echo "setup MCParamsSvc v0 in /home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/centos7_amd64_gcc830/Pre-Release/J21v1r0-branch-python3/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtMCParamsSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtMCParamsSvctempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  -no_cleanup $* >${cmtMCParamsSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  -no_cleanup $* >${cmtMCParamsSvctempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtMCParamsSvctempfile}
  unset cmtMCParamsSvctempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtMCParamsSvctempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtMCParamsSvctempfile}
unset cmtMCParamsSvctempfile
return $cmtsetupstatus

