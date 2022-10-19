echo on
set dirname=%date:~-4,4%"-"%date:~7,2%"-"%date:~4,2%
mkdir C:\Users\503262108\Documents\Test_Programs\Robodrill_Backups\%dirname%
rem set LOG=C:\Users\503262108\Documents\Test_Programs\Robodrill_Backups\Robodrill_Log.txt
rem
rem robocopy C:\Users\503262108\Documents\GitHub\NC-Toolkit\ugcam\UGPostprocessors\_STANDALONE\WCRM110_077 C:\Users\503262108\Documents\Test_Programs\Robodrill_Backups\%dirname% /e /np /mt /log+:%LOG%
rem robocopy C:\Users\503262108\Documents\GitHub\NC-Toolkit\ugcam\UGPostprocessors\_STANDALONE\WCRM110_077 C:\Users\503262108\Documents\Test_Programs\Robodrill_Backups /e /np mt/ /log+:backup_log.txt

:: Parameters ::
::-------------------------------------------------------------------------

:: Set Variables ::

   :: Date:
      set mydate=%date:~-4,4%-%date:~7,2%-%date:~4,2%

   :: Time:

      :: Hour:
         set hh=%time:~0,2%
            rem if %hour:~0,1% == "" set HH=0%hour:~1,1%

      :: Minute:
         set MM=%time:~3,2%

      :: Seconds
         set SS=%time:~6,2%

      set dtime=%HH%_%mm%_%ss%

   :: Destination:
      set Dest=C:\Users\503262108\Documents\Test_Programs\Robodrill_Backups\%dirname%

   :: Log:
      set LogDir=C:\Users\troyp\Documents\GitHub\Development

   :: Source:
      set Src=C:\Users\troyp\Documents\GitHub\Development

   :: RoboCopy:

      :: Log:
         set Log=/V /TS /log+:"%LogDir%\%mydate%_%dtime%.log"

      :: Options:
         rem set Options=/TBD

      :: What to Copy:
         set What=/COPY:DAT /DCOPY:DAT /MT /E /XD Logs

      :: Save Job:
         rem set Save=/SAVE:C:\ProgramData\Scripts\Robocopy\File-Sync


:: Sync ::
::-------------------------------------------------------------------------
robocopy %Src% %Dest% %What% %Log%
robocopy %Src% C:\Users\503262108\Documents\Test_Programs\WCRM110_077 %What%
echo off