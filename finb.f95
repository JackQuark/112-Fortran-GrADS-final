PROGRAM finb
!==================================================

IMPLICIT NONE
INTEGER                          :: n, i, LREC
CHARACTER(2)                     :: hh, mm
INTEGER, DIMENSION(30, 301, 251) :: input
REAL   , DIMENSION(30, 301, 251) :: temp
REAL   , DIMENSION(301, 251)     :: avg, STD
REAL   , DIMENSION(4051,  2)     :: look

!==================================================
!read lookup.txt
OPEN (UNIT=10, FILE='/home/B12/b12209017/fin_f/finf/lookup.txt',&
      FORM='FORMATTED', STATUS='OLD') 
DO i = 1, 4051
    
        READ(10,*) look(i,:)
        
ENDDO

!read data from 08:00 to 22:30
DO n = 1, 30
    
    !time select
    IF (MOD(n,2) == 0) THEN
        WRITE(hh,'(I02.2)') 7 + n / 2
        WRITE(mm,'(I02.2)') 30
    ELSE 
        WRITE(hh,'(I02.2)') 7 + (n+1) / 2
        WRITE(mm,'(I02.2)') 0
    ENDIF

    OPEN (UNIT=20, FILE='/home/B12/b12209017/fin_f/finf/input/20200723.'//hh//mm//'TST_band14.txt',&
          FORM='FORMATTED', STATUS='OLD')
          
    DO i = 1, 251
        
        READ(20,*) input(n,:,i)
        
        !fill temp array with real temperature
        temp(n,:,i) = look(input(n,:,i)+1, 2)

    ENDDO
ENDDO
     
!calculate mean temperature and STD
avg = SUM(temp, 1) / 30
STD = sqrt( SUM(temp**2, 1) / 30 - avg(:,:)**2 )

!output data as binary file
INQUIRE(IOLENGTH=LREC) avg
OPEN(unit=30,FILE='finb_0723.dat',FORM='unformatted', &
     STATUS='UNKNOWN', ACCESS='DIRECT',RECL=LREC)

WRITE(30,REC=1) avg(:,:)
WRITE(30,REC=2) STD(:,:)

!close file
close(10)
close(20)
close(30)
!==================================================
END PROGRAM   
