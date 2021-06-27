# echo "cleanup MCParamsSvc v0 in /home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/centos7_amd64_gcc830/Pre-Release/J21v1r0-branch-python3/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtMCParamsSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtMCParamsSvctempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  $* >${cmtMCParamsSvctempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  $* >${cmtMCParamsSvctempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtMCParamsSvctempfile}
  unset cmtMCParamsSvctempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtMCParamsSvctempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtMCParamsSvctempfile}
unset cmtMCParamsSvctempfile
exit $cmtcleanupstatus

