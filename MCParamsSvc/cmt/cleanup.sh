# echo "cleanup MCParamsSvc v0 in /home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/centos7_amd64_gcc830/Pre-Release/J21v1r0-branch-python3/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtMCParamsSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtMCParamsSvctempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  $* >${cmtMCParamsSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  $* >${cmtMCParamsSvctempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtMCParamsSvctempfile}
  unset cmtMCParamsSvctempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtMCParamsSvctempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtMCParamsSvctempfile}
unset cmtMCParamsSvctempfile
return $cmtcleanupstatus

