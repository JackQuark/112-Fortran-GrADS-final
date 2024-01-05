PROGRAM fina
!==================================================

IMPLICIT NONE
INTEGER                      :: i
REAL                         :: maxK, minK, avg
CHARACTER(4)                 :: hhmm
INTEGER, DIMENSION(301, 251) :: TW, input
REAL   , DIMENSION(301, 251) :: temp
REAL   , DIMENSION(4051,  2) :: look

!==================================================
!input selected time
CALL getarg(1, hhmm)
      
!read file
OPEN (UNIT=10, FILE='/home/B12/b12209017/fin_f/finf/lookup.txt',&
      FORM='FORMATTED', STATUS='OLD')
OPEN (UNIT=20, FILE='/home/B12/b12209017/fin_f/finf/TWlsm2km.txt',&
      FORM='FORMATTED', STATUS='OLD')
OPEN (UNIT=30, FILE='/home/B12/b12209017/fin_f/finf/input/20200723.'//hhmm//'TST_band14.txt',&
      FORM='FORMATTED', STATUS='OLD')

DO i = 1, 4051

    READ(10,*) look (i,:)

ENDDO

DO i = 1, 251

    READ(20,*) TW   (:,i)
    READ(30,*) input(:,i)
    
    !fill temp array with real temperature
    temp (:,i) = look(input(:,i)+1, 2)

ENDDO

!get three kinds of value
maxK = MAXVAL(temp, TW == 1)
minK = MINVAL(temp, TW == 1)
avg  = SUM   (temp, TW == 1) / COUNT(TW == 1)

!output
WRITE(*,100) 'The brightness temperature at ', hhmm(1:2), ':', hhmm(3:4), ' in Taiwan.'
        100  FORMAT(A30, A2, A1, A2, A11)
WRITE(*,200) maxK
        200  FORMAT('Max  value =  ', F6.2, ' K')
WRITE(*,300) minK
        300  FORMAT('Min  value =  ', F6.2, ' K')
WRITE(*,400) avg 
        400  FORMAT('Mean value =  ', F6.2, ' K')

!close file
close(10)
close(20)
close(30)
!==================================================
END PROGRAM
