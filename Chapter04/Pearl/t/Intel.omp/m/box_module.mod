	  D8  �   k820309    �          15.0        �zfT                                                                                                           
       src/box_f.f90 BOX_MODULE                      @                             
                                                              u #BOX_NOBOX                                                           u #BOX_DIM                                                           u #BOX_VOLUME                                                           u #BOX_UPB    #BOX_UPB_D                                                           u #BOX_SET_UPB_D                                                           u #BOX_LWB    #BOX_LWB_D 	                                                          u #BOX_SET_LWB_D 
                                                          u #BOX_COARSEN_I                                                           u #BOX_GROW_N    #BOX_GROW_N_D_F                                                           u #BOX_SHIFT_D    #BOX_SHIFT_V                                                               #BOX_LESS                                                           u #BOX_INTERSECTION                                                              o #BOX_INTERSECTION                                                           u #BOX_INTERSECTS                                                           u #BOX_BBOX                                                           u #BOX_EXTENT    #BOX_EXTENT_D                                                          u #BOX_PRINT                                                           u #BOX_CONTAINS    #BOX_CONTAINS_IV                                                           u #BOX_EMPTY                                                                                                       3                  @                               '                    #DIM    #LO    #HI               �                                                                         �                                                      0                �                                                             p          p            p                                                  �                                             ���                        �                                                             p          p            p                                                  �                                               �����                                                        HUGE &         @     X                                                      #DIM     #BOX              
                                              %         @     X                                                      #BX !             
                                  !                   #BOX    %         @     X                                                       #BX "             
  @                               "                   #BOX    (        `    X                                                                   #BX #   p          5 8 O p        U            5 8 O p        U                                   
                                  #                   #BOX    %         @     X                                                     #BX $   #DIM %             
                                  $                   #BOX              
                                  %           #         @      X                                                 #BX &   #DIM '   #V (             
D                                 &                    #BOX              
                                  '                     
                                  (           (        `    X                                                                   #BX )   p          5 8 O p        U            5 8 O p        U                                   
                                  )                   #BOX    %         @     X                          	                           #BX *   #DIM +             
                                  *                   #BOX              
                                  +           #         @      X                             
                    #BX ,   #DIM -   #V .             
D                                 ,                    #BOX              
                                  -                     
                                  .           &         @     X                                                      #BX /   #CI 0   #BOX              
                                  /                   #BOX              
  @                               0           &         @     X                                                     #BX 1   #RI 2   #BOX              
                                  1                   #BOX              
                                  2           &         @     X                                                      #BX 3   #RI 4   #DIM 5   #FACE 6   #BOX              
                                  3                   #BOX              
                                  4                     
                                  5                     
  @                               6           &         @     X                                                     #BX 7   #I 8   #DIM 9   #BOX              
                                  7                   #BOX              
                                  8                     
                                  9           &         @     X                                                      #BX :   #IV ;   #BOX              
                                  :                   #BOX              
                                  ;                    	             &                                           %         @     X                                                      #BX1 <   #BX2 =             
                                  <                   #BOX              
                                  =                   #BOX    &         @     X                                                     #BOX_INTERSECTION%MAX >   #BOX_INTERSECTION%MIN ?   #BX1 @   #BX2 A   #BOX                                              >     MAX                                           ?     MIN           
                                  @                   #BOX              
                                  A                   #BOX    %         @     X                                                     #BOX_INTERSECTS%MAX B   #BOX_INTERSECTS%MIN C   #BOX_INTERSECTS%ALL D   #BX1 E   #BX2 F                                             B     MAX                                           C     MIN                                           D     ALL           
                                  E                   #BOX              
                                  F                   #BOX    &         @     X                                                     #BOX_BBOX%MAX G   #BOX_BBOX%MIN H   #B1 I   #B2 J   #BOX                                              G     MAX                                           H     MIN           
                                  I                   #BOX              
                                  J                   #BOX    (        `    X                                                                   #BX K   p          5 8 O p        U            5 8 O p        U                                   
                                  K                   #BOX    %         @     X                                                     #BX L   #DIM M             
                                  L                   #BOX              
                                  M           #         @      X                                               #BOX_PRINT%PRESENT N   #BX O   #STR P   #UNIT Q   #ADVANCE R   #LEGACY S   #NODAL T   #SKIP U                                             N     PRESENT          
                                  O                   #BOX              
 @                              P                    1           
 @                               Q                     
 @                              R                    1           
 @                               S                     
 @                               T                                 &                                                     
 @                               U           %         @     X                                                    #BOX_CONTAINS%PRESENT V   #BOX_CONTAINS%ALL W   #BX1 X   #BX2 Y   #STRICT Z                                             V     PRESENT                                           W     ALL           
                                  X                   #BOX              
                                  Y                   #BOX              
 @                               Z           %         @     X                                                     #BOX_CONTAINS_IV%PRESENT [   #BOX_CONTAINS_IV%ALL \   #BX1 ]   #IV ^   #STRICT _                                             [     PRESENT                                           \     ALL           
                                  ]                   #BOX              
                                  ^                                 &                                                     
 @                               _           %         @     X                                                     #BX `             
                                  `                   #BOX    %         H                               a                          #INT_COARSEN%ABS b   #V c   #I d                                             b     ABS           
                                  c                     
                                  d           &         @                                 e                          #MAKE_BOX%PRESENT f   #LO g   #HI h   #BOX                                              f     PRESENT           
  @                               g                                 &                                                     
 @                               h                                 &                                           #         @                                  i                   #BOX_BUILD_2%SIZE j   #BX k   #LO l   #HI m                                             j     SIZE           D                                 k                    #BOX              
 @                               l                                 &                                                     
 @                               m                                 &                                           &         @                                n                          #BOX_NODALIZE%PRESENT o   #BX p   #NODAL q   #BOX                                              o     PRESENT           
                                  p                   #BOX              
 @                               q                                 &                                           #         @                                   r                    #BX s   #BXL t   #BXR u   #DIM v   #ICHOP w             
  @                               s                   #BOX              D                                 t                    #BOX              D                                 u                    #BOX              
  @                               v                     
                                  w           #         @                                   x                	   #BOX_PERIODIC_SHIFT%ANY y   #BOX_PERIODIC_SHIFT%PRESENT z   #BOX_PERIODIC_SHIFT%ALL {   #DMN |   #B }   #NODAL ~   #PMASK    #NG �   #SHFT �   #CNT �   #BXS �   #SYNC_SHIFT �                                             y     ANY                                           z     PRESENT                                           {     ALL           
  @                               |                   #BOX              
  @                               }                   #BOX              
  @                               ~                                 &                                                     
                                                                   &                                                     
  @                               �                     D                                 �                                  &                   &                                                     D                                 �                      F @                               �                                   &                                           #BOX              
 @                               �              �   !      fn#fn    �   @   J   BL_TYPES      O       gen@NOBOX    P  M       gen@GET_DIM    �  P       gen@VOLUME    �  \       gen@UPB    I  S       gen@SET_UPB    �  \       gen@LWB    �  S       gen@SET_LWB    K  S       gen@COARSEN    �  d       gen@GROW      b       gen@SHIFT    d  N      i@ !   �  V       gen@INTERSECTION      V      u@INTERSECT    ^  T       gen@INTERSECTS    �  N       gen@BBOX       b       gen@EXTENT    b  O       gen@PRINT    �  g       gen@CONTAINS      O       gen@EMPTY    g  q       MAX_SPACEDIM    �  i       BOX    A  �   a   BOX%DIM    �  �   a   BOX%LO    �	  �   a   BOX%HI    �
  =       HUGE      b       BOX_NOBOX    u  @   a   BOX_NOBOX%DIM    �  X       BOX_DIM      Q   a   BOX_DIM%BX    ^  X       BOX_VOLUME    �  Q   a   BOX_VOLUME%BX      �       BOX_UPB    �  Q   a   BOX_UPB%BX    4  a       BOX_UPB_D    �  Q   a   BOX_UPB_D%BX    �  @   a   BOX_UPB_D%DIM    &  `       BOX_SET_UPB_D !   �  Q   a   BOX_SET_UPB_D%BX "   �  @   a   BOX_SET_UPB_D%DIM       @   a   BOX_SET_UPB_D%V    W  �       BOX_LWB    3  Q   a   BOX_LWB%BX    �  a       BOX_LWB_D    �  Q   a   BOX_LWB_D%BX    6  @   a   BOX_LWB_D%DIM    v  `       BOX_SET_LWB_D !   �  Q   a   BOX_SET_LWB_D%BX "   '  @   a   BOX_SET_LWB_D%DIM     g  @   a   BOX_SET_LWB_D%V    �  i       BOX_COARSEN_I !     Q   a   BOX_COARSEN_I%BX !   a  @   a   BOX_COARSEN_I%CI    �  i       BOX_GROW_N    
  Q   a   BOX_GROW_N%BX    [  @   a   BOX_GROW_N%RI    �  |       BOX_GROW_N_D_F "     Q   a   BOX_GROW_N_D_F%BX "   h  @   a   BOX_GROW_N_D_F%RI #   �  @   a   BOX_GROW_N_D_F%DIM $   �  @   a   BOX_GROW_N_D_F%FACE    (  q       BOX_SHIFT_D    �  Q   a   BOX_SHIFT_D%BX    �  @   a   BOX_SHIFT_D%I     *  @   a   BOX_SHIFT_D%DIM    j  i       BOX_SHIFT_V    �  Q   a   BOX_SHIFT_V%BX    $  �   a   BOX_SHIFT_V%IV    �  b       BOX_LESS      Q   a   BOX_LESS%BX1    c  Q   a   BOX_LESS%BX2 !   �  �       BOX_INTERSECTION %   S  <      BOX_INTERSECTION%MAX %   �  <      BOX_INTERSECTION%MIN %   �  Q   a   BOX_INTERSECTION%BX1 %     Q   a   BOX_INTERSECTION%BX2    m  �       BOX_INTERSECTS #     <      BOX_INTERSECTS%MAX #   S  <      BOX_INTERSECTS%MIN #   �  <      BOX_INTERSECTS%ALL #   �  Q   a   BOX_INTERSECTS%BX1 #     Q   a   BOX_INTERSECTS%BX2    m  �       BOX_BBOX    �  <      BOX_BBOX%MAX    6  <      BOX_BBOX%MIN    r  Q   a   BOX_BBOX%B1    �  Q   a   BOX_BBOX%B2       �       BOX_EXTENT    �   Q   a   BOX_EXTENT%BX    A!  a       BOX_EXTENT_D     �!  Q   a   BOX_EXTENT_D%BX !   �!  @   a   BOX_EXTENT_D%DIM    3"  �       BOX_PRINT "   �"  @      BOX_PRINT%PRESENT    #  Q   a   BOX_PRINT%BX    l#  L   a   BOX_PRINT%STR    �#  @   a   BOX_PRINT%UNIT "   �#  L   a   BOX_PRINT%ADVANCE !   D$  @   a   BOX_PRINT%LEGACY     �$  �   a   BOX_PRINT%NODAL    %  @   a   BOX_PRINT%SKIP    P%  �       BOX_CONTAINS %   �%  @      BOX_CONTAINS%PRESENT !   .&  <      BOX_CONTAINS%ALL !   j&  Q   a   BOX_CONTAINS%BX1 !   �&  Q   a   BOX_CONTAINS%BX2 $   '  @   a   BOX_CONTAINS%STRICT     L'  �       BOX_CONTAINS_IV (   �'  @      BOX_CONTAINS_IV%PRESENT $   /(  <      BOX_CONTAINS_IV%ALL $   k(  Q   a   BOX_CONTAINS_IV%BX1 #   �(  �   a   BOX_CONTAINS_IV%IV '   H)  @   a   BOX_CONTAINS_IV%STRICT    �)  X       BOX_EMPTY    �)  Q   a   BOX_EMPTY%BX    1*  s       INT_COARSEN     �*  <      INT_COARSEN%ABS    �*  @   a   INT_COARSEN%V     +  @   a   INT_COARSEN%I    `+         MAKE_BOX !   �+  @      MAKE_BOX%PRESENT    ,  �   a   MAKE_BOX%LO    �,  �   a   MAKE_BOX%HI    7-  v       BOX_BUILD_2 !   �-  =      BOX_BUILD_2%SIZE    �-  Q   a   BOX_BUILD_2%BX    ;.  �   a   BOX_BUILD_2%LO    �.  �   a   BOX_BUILD_2%HI    S/  �       BOX_NODALIZE %   �/  @      BOX_NODALIZE%PRESENT     0  Q   a   BOX_NODALIZE%BX #   j0  �   a   BOX_NODALIZE%NODAL    �0  v       BOX_CHOP    l1  Q   a   BOX_CHOP%BX    �1  Q   a   BOX_CHOP%BXL    2  Q   a   BOX_CHOP%BXR    _2  @   a   BOX_CHOP%DIM    �2  @   a   BOX_CHOP%ICHOP #   �2  �       BOX_PERIODIC_SHIFT '   �3  <      BOX_PERIODIC_SHIFT%ANY +   4  @      BOX_PERIODIC_SHIFT%PRESENT '   U4  <      BOX_PERIODIC_SHIFT%ALL '   �4  Q   a   BOX_PERIODIC_SHIFT%DMN %   �4  Q   a   BOX_PERIODIC_SHIFT%B )   35  �   a   BOX_PERIODIC_SHIFT%NODAL )   �5  �   a   BOX_PERIODIC_SHIFT%PMASK &   K6  @   a   BOX_PERIODIC_SHIFT%NG (   �6  �   a   BOX_PERIODIC_SHIFT%SHFT '   /7  @   a   BOX_PERIODIC_SHIFT%CNT '   o7  �   a   BOX_PERIODIC_SHIFT%BXS .   8  @   a   BOX_PERIODIC_SHIFT%SYNC_SHIFT 