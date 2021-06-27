# echo "setup MCParamsSvc v0 in /home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/centos7_amd64_gcc830/Pre-Release/J21v1r0-branch-python3/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtMCParamsSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtMCParamsSvctempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  -no_cleanup $* >${cmtMCParamsSvctempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=MCParamsSvc -version=v0 -path=/home/ihep/2020-3-17/trunk/offline/Simulation/DetSimV2  -no_cleanup $* >${cmtMCParamsSvctempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtMCParamsSvctempfile}
  unset cmtMCParamsSvctempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtMCParamsSvctempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtMCParamsSvctempfile}
unset cmtMCParamsSvctempfile
exit $cmtsetupstatus

