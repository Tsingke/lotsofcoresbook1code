	  èB  ®   k820309              15.0        FzfT                                                                                                           
       src/boxarray_f.f90 BOXARRAY_MODULE              BOXARRAY_MAXSIZE_L                      @                             
                @                                        
                                                          
                                                              u #BOXARRAY_DATAPTR                                                          u #BOX_DIM    #BOXARRAY_DIM                                                           u #BOXARRAY_BUILT_Q                                                           u #BOXARRAY_BUILD_COPY                                                         u #LIST_BUILD_V_BOX 	   #BOXARRAY_BUILD_V 
   #BOXARRAY_BUILD_L    #BOXARRAY_BUILD_BX                                                         u #LIST_DESTROY_BOX    #BOXARRAY_DESTROY                                                           u #BOXARRAY_NBOXES                                                          u #BOX_VOLUME    #BOXARRAY_VOLUME                                                           u #BOXARRAY_GET_BOX                                                           u #BOXARRAY_MAXSIZE_I    #BOXARRAY_MAXSIZE_V                                                          u #BOXARRAY_GROW_N                                                          u #BOX_BBOX    #BOXARRAY_BBOX                      @                              '                    #DIM    #LO    #HI                                                                                                                                                0                                                                             p          p            p                                                                                                ÿÿÿ                                                                                     p          p            p                                                                                                  ÿÿÿÿ                         @                               '                    #SIZE    #HEAD    #TAIL #                D                                                                                                                               0                D                                  0                    #LIST_BOX_NODE                                           y#LIST_BOX_NODE                                                                    @                              '0                    #V     #PREV !   #NEXT "                 D                                                          #BOX                D                             !     0                     #LIST_BOX_NODE                                           y#LIST_BOX_NODE                                                               D                             "     0       (             #LIST_BOX_NODE                                           y#LIST_BOX_NODE                                                               D                             #     0                    #LIST_BOX_NODE                                           y#LIST_BOX_NODE                                                                                             $     NULL                                            %     SIZE &         @                                &                          #BOX_NODALIZE%PRESENT '   #BX (   #NODAL )   #BOX                                               '     PRESENT           
                                  (                   #BOX              
                                 )                                 &                                                                                        *                                                         %         @                                                           #BX +             
                                  +                   #BOX    &         @                                ,                          #BOXLIST_BOXLIST_DIFF%ASSOCIATED -   #BX .   #BXL /   #LIST_BOX                                               -     ASSOCIATED           
                                  .                   #BOX              
                                  /                   #LIST_BOX    #         @                                  0                    #BX 1   #BXL 2   #BXR 3   #DIM 4   #ICHOP 5             
                                  1                   #BOX                                               2                    #BOX                                               3                    #BOX              
                                  4                     
                                  5           &         @                               6                           #DIM 7   #BOX              
                                  7           %         @                                                           #BX 8             
                                  8                   #BOX    (        `                               9                                        #BX :   p          5 8 O p        U            5 8 O p        U                                    
                                  :                   #BOX    %         @                               ;                           #BX <   #DIM =             
                                  <                   #BOX              
                                  =           &         @                               >                           #BX ?   #RI @   #BOX              
                                  ?                   #BOX              
                                  @           &         @                                 A                           #BX B   #RI C   #DIM D   #FACE E   #BOX              
                                  B                   #BOX              
                                  C                     
                                  D                     
                                  E           %         @                                F                           #BX1 G   #BX2 H             
                                  G                   #BOX              
                                  H                   #BOX    &         @                                 I                          #BOX_INTERSECTION%MIN J   #BOX_INTERSECTION%MAX K   #BX1 L   #BX2 M   #BOX                                               J     MIN                                            K     MAX           
                                  L                   #BOX              
                                  M                   #BOX    &         @                                                         #BOX_BBOX%MIN N   #BOX_BBOX%MAX O   #B1 P   #B2 Q   #BOX                                               N     MIN                                            O     MAX           
                                  P                   #BOX              
                                  Q                   #BOX    (        `                              R                                        #BX S   p          5 8 O p        U            5 8 O p        U                                    
                                  S                   #BOX    %         @                                T                           #BX U   #DIM V             
                                  U                   #BOX              
                                  V           &         @                               W                           #N X   #BOX              
                                  X     0              #LIST_BOX_NODE    #         @                                  Y                    #N Z   #V [             
                                 Z     0               #LIST_BOX_NODE              
                                  [                   #BOX    &         @                               \     0                      #N ]   #LIST_BOX_NODE                                              ]     0               #LIST_BOX_NODE    #         @                                  	                    #R ^   #D _                                              ^                    #LIST_BOX              
                                 _                                  &                                           #BOX    #         @                                                      #R `             
                                 `                    #LIST_BOX    %         @                               a                           #L b             
                                  b                   #LIST_BOX    &         @                               c     0                      #L d   #LIST_BOX_NODE              
                                  d                   #LIST_BOX    #         @                                  e                   #LIST_PUSH_BACK_BOX%ASSOCIATED f   #L g   #V h                                              f     ASSOCIATED           
                                 g                    #LIST_BOX              
                                  h                   #BOX    #         @                                  i                    #L1 j   #L2 k             
                                 j                    #LIST_BOX              
                                 k                    #LIST_BOX                     @                          l     'P                    #DIM m   #NBOXES n   #BXS o               D                              m                                                                                                 0                 D                              n                                                                                                0              D                             o                               #BOX              &                                                                                  y#BOX                                                   )         D    X                                                                    #BA p   #BOX              &                                                     
                                  p     P              #BOXARRAY l   %         @     X                                                      #BA q             
                                  q     P              #BOXARRAY l   %         @     X                                                     #BA r             
                                  r     P              #BOXARRAY l   #         @      X                                                #BA s   #BA1 t             
D @                               s     P               #BOXARRAY l             
  @                               t     P              #BOXARRAY l   #         @      X                             
                   #BOXARRAY_BUILD_V%PRESENT u   #BA v   #BXS w   #SORT x                                             u     PRESENT           
D @                               v     P               #BOXARRAY l             
 @                               w                                  &                                           #BOX              
 @                               x           #         @      X                                               #BOXARRAY_BUILD_L%ASSOCIATED y   #BOXARRAY_BUILD_L%PRESENT z   #BA {   #BL |   #SORT }                                             y     ASSOCIATED                                           z     PRESENT           
D @                               {     P               #BOXARRAY l             
  @                               |                   #LIST_BOX              
 @                               }           #         @      X                                                #BA ~   #BX              
D @                               ~     P               #BOXARRAY l             
                                                     #BOX    #         @      X                                               #BOXARRAY_DESTROY%ASSOCIATED    #BA                                                   ASSOCIATED           
D                                      P               #BOXARRAY l   %         @     X                                                      #BA              
                                       P              #BOXARRAY l   %         @     X                                                       #BA              
                                       P              #BOXARRAY l   &         @     X                                                      #BA    #I    #BOX              
                                       P              #BOXARRAY l             
                                             #         @      X                                                 #BXA    #CHUNK             
D @                                    P               #BOXARRAY l             
                                             #         @      X                                                #BXA    #CHUNK              
D @                                    P               #BOXARRAY l             
  @                                                                &                                           #         @      X                                                #BA    #N              
D @                                    P               #BOXARRAY l             
  @                                          &         @     X                                                      #BA    #BOX              
  @                                    P              #BOXARRAY l   #         @                                                     #BOXARRAY_VERIFY_DIM%PRESENT    #BA    #STAT                                                   PRESENT           
  @                                    P              #BOXARRAY l             F @                                           #         @                                                      #BA              
 @                                    P               #BOXARRAY l   #         @                                                       #BA    #NODAL              
D                                      P               #BOXARRAY l             
 @                                                                &                                           #         @                                                       #BAO    #BX    #N              D @                                    P               #BOXARRAY l             
  @                                                  #BOX              
  @                                          #         @                                                      #BAO    #BA    #N              D @                                    P               #BOXARRAY l             
  @                                    P              #BOXARRAY l             
  @                                          #         @                                                      #BAO    #BA               
D @                                    P               #BOXARRAY l             
  @                                     P              #BOXARRAY l          +      fn#fn %   Ë   #   b   uapp(BOXARRAY_MODULE    î   @   J   BL_TYPES    .  @   J   BOX_MODULE     n  @   J   LIST_BOX_MODULE    ®  V       gen@DATAPTR      _       gen@GET_DIM    c  V       gen@BUILT_Q    ¹  Y       gen@COPY             gen@BUILD    «  l       gen@DESTROY      U       gen@NBOXES    l  e       gen@VOLUME    Ñ  V       gen@GET_BOX %   '  p       gen@BOXARRAY_MAXSIZE "     U       gen@BOXARRAY_GROW    ì  a       gen@BBOX    M  i       BOX+BOX_MODULE #   ¶  ¥   a   BOX%DIM+BOX_MODULE "   [  ø   a   BOX%LO+BOX_MODULE "   S  ø   a   BOX%HI+BOX_MODULE )   K	  n       LIST_BOX+LIST_BOX_MODULE 3   ¹	  ¥   %   LIST_BOX%SIZE+LIST_BOX_MODULE=SIZE 3   ^
  Ö   %   LIST_BOX%HEAD+LIST_BOX_MODULE=HEAD .   4  k       LIST_BOX_NODE+LIST_BOX_MODULE 2     Y   %   LIST_BOX_NODE%V+LIST_BOX_MODULE=V 8   ø  Ö   %   LIST_BOX_NODE%PREV+LIST_BOX_MODULE=PREV 8   Î  Ö   %   LIST_BOX_NODE%NEXT+LIST_BOX_MODULE=NEXT 3   ¤  Ö   %   LIST_BOX%TAIL+LIST_BOX_MODULE=TAIL %   z  =       NULL+LIST_BOX_MODULE %   ·  =       SIZE+LIST_BOX_MODULE (   ô         BOX_NODALIZE+BOX_MODULE 0   z  @      BOX_NODALIZE%PRESENT+BOX_MODULE +   º  Q   a   BOX_NODALIZE%BX+BOX_MODULE .        a   BOX_NODALIZE%NODAL+BOX_MODULE      p       LL_T+BL_TYPES &     X       BOX_VOLUME+BOX_MODULE )   _  Q   a   BOX_VOLUME%BX+BOX_MODULE 5   °         BOXLIST_BOXLIST_DIFF+LIST_BOX_MODULE @   D  C      BOXLIST_BOXLIST_DIFF%ASSOCIATED+LIST_BOX_MODULE 8     Q   a   BOXLIST_BOXLIST_DIFF%BX+LIST_BOX_MODULE 9   Ø  V   a   BOXLIST_BOXLIST_DIFF%BXL+LIST_BOX_MODULE $   .  v       BOX_CHOP+BOX_MODULE '   ¤  Q   a   BOX_CHOP%BX+BOX_MODULE (   õ  Q   a   BOX_CHOP%BXL+BOX_MODULE (   F  Q   a   BOX_CHOP%BXR+BOX_MODULE (     @   a   BOX_CHOP%DIM+BOX_MODULE *   ×  @   a   BOX_CHOP%ICHOP+BOX_MODULE %     b       BOX_NOBOX+BOX_MODULE )   y  @   a   BOX_NOBOX%DIM+BOX_MODULE #   ¹  X       BOX_DIM+BOX_MODULE &     Q   a   BOX_DIM%BX+BOX_MODULE #   b  Ü       BOX_UPB+BOX_MODULE &   >  Q   a   BOX_UPB%BX+BOX_MODULE %     a       BOX_UPB_D+BOX_MODULE (   ð  Q   a   BOX_UPB_D%BX+BOX_MODULE )   A  @   a   BOX_UPB_D%DIM+BOX_MODULE &     i       BOX_GROW_N+BOX_MODULE )   ê  Q   a   BOX_GROW_N%BX+BOX_MODULE )   ;  @   a   BOX_GROW_N%RI+BOX_MODULE *   {  |       BOX_GROW_N_D_F+BOX_MODULE -   ÷  Q   a   BOX_GROW_N_D_F%BX+BOX_MODULE -   H  @   a   BOX_GROW_N_D_F%RI+BOX_MODULE .     @   a   BOX_GROW_N_D_F%DIM+BOX_MODULE /   È  @   a   BOX_GROW_N_D_F%FACE+BOX_MODULE $     b       BOX_LESS+BOX_MODULE (   j  Q   a   BOX_LESS%BX1+BOX_MODULE (   »  Q   a   BOX_LESS%BX2+BOX_MODULE ,            BOX_INTERSECTION+BOX_MODULE 0   «  <      BOX_INTERSECTION%MIN+BOX_MODULE 0   ç  <      BOX_INTERSECTION%MAX+BOX_MODULE 0   #  Q   a   BOX_INTERSECTION%BX1+BOX_MODULE 0   t  Q   a   BOX_INTERSECTION%BX2+BOX_MODULE $   Å         BOX_BBOX+BOX_MODULE (   R  <      BOX_BBOX%MIN+BOX_MODULE (     <      BOX_BBOX%MAX+BOX_MODULE '   Ê  Q   a   BOX_BBOX%B1+BOX_MODULE '     Q   a   BOX_BBOX%B2+BOX_MODULE &   l  Ü       BOX_EXTENT+BOX_MODULE )   H   Q   a   BOX_EXTENT%BX+BOX_MODULE (      a       BOX_EXTENT_D+BOX_MODULE +   ú   Q   a   BOX_EXTENT_D%BX+BOX_MODULE ,   K!  @   a   BOX_EXTENT_D%DIM+BOX_MODULE 4   !  `       LIST_NODE_VALUE_BOX+LIST_BOX_MODULE 6   ë!  [   a   LIST_NODE_VALUE_BOX%N+LIST_BOX_MODULE 2   F"  V       LIST_NODE_SET_BOX+LIST_BOX_MODULE 4   "  [   a   LIST_NODE_SET_BOX%N+LIST_BOX_MODULE 4   ÷"  Q   a   LIST_NODE_SET_BOX%V+LIST_BOX_MODULE 3   H#  j       LIST_NODE_NEXT_BOX+LIST_BOX_MODULE 5   ²#  [   a   LIST_NODE_NEXT_BOX%N+LIST_BOX_MODULE 1   $  V       LIST_BUILD_V_BOX+LIST_BOX_MODULE 3   c$  V   a   LIST_BUILD_V_BOX%R+LIST_BOX_MODULE 3   ¹$     a   LIST_BUILD_V_BOX%D+LIST_BOX_MODULE 1   N%  O       LIST_DESTROY_BOX+LIST_BOX_MODULE 3   %  V   a   LIST_DESTROY_BOX%R+LIST_BOX_MODULE .   ó%  W       LIST_SIZE_BOX+LIST_BOX_MODULE 0   J&  V   a   LIST_SIZE_BOX%L+LIST_BOX_MODULE /    &  j       LIST_BEGIN_BOX+LIST_BOX_MODULE 1   
'  V   a   LIST_BEGIN_BOX%L+LIST_BOX_MODULE 3   `'  y       LIST_PUSH_BACK_BOX+LIST_BOX_MODULE >   Ù'  C      LIST_PUSH_BACK_BOX%ASSOCIATED+LIST_BOX_MODULE 5   (  V   a   LIST_PUSH_BACK_BOX%L+LIST_BOX_MODULE 5   r(  Q   a   LIST_PUSH_BACK_BOX%V+LIST_BOX_MODULE 0   Ã(  X       LIST_SPLICE_BOX+LIST_BOX_MODULE 3   )  V   a   LIST_SPLICE_BOX%L1+LIST_BOX_MODULE 3   q)  V   a   LIST_SPLICE_BOX%L2+LIST_BOX_MODULE    Ç)  n       BOXARRAY    5*  ¥   !   BOXARRAY%DIM     Ú*  ¥   !   BOXARRAY%NBOXES    +    !   BOXARRAY%BXS !   ,  ­       BOXARRAY_DATAPTR $   2-  V   a   BOXARRAY_DATAPTR%BA    -  X       BOXARRAY_DIM     à-  V   a   BOXARRAY_DIM%BA !   6.  X       BOXARRAY_BUILT_Q $   .  V   a   BOXARRAY_BUILT_Q%BA $   ä.  Y       BOXARRAY_BUILD_COPY '   =/  V   a   BOXARRAY_BUILD_COPY%BA (   /  V   a   BOXARRAY_BUILD_COPY%BA1 !   é/         BOXARRAY_BUILD_V )   j0  @      BOXARRAY_BUILD_V%PRESENT $   ª0  V   a   BOXARRAY_BUILD_V%BA %    1     a   BOXARRAY_BUILD_V%BXS &   1  @   a   BOXARRAY_BUILD_V%SORT !   Õ1  ¡       BOXARRAY_BUILD_L ,   v2  C      BOXARRAY_BUILD_L%ASSOCIATED )   ¹2  @      BOXARRAY_BUILD_L%PRESENT $   ù2  V   a   BOXARRAY_BUILD_L%BA $   O3  V   a   BOXARRAY_BUILD_L%BL &   ¥3  @   a   BOXARRAY_BUILD_L%SORT "   å3  X       BOXARRAY_BUILD_BX %   =4  V   a   BOXARRAY_BUILD_BX%BA %   4  Q   a   BOXARRAY_BUILD_BX%BX !   ä4  q       BOXARRAY_DESTROY ,   U5  C      BOXARRAY_DESTROY%ASSOCIATED $   5  V   a   BOXARRAY_DESTROY%BA     î5  X       BOXARRAY_NBOXES #   F6  V   a   BOXARRAY_NBOXES%BA     6  X       BOXARRAY_VOLUME #   ô6  V   a   BOXARRAY_VOLUME%BA !   J7  h       BOXARRAY_GET_BOX $   ²7  V   a   BOXARRAY_GET_BOX%BA #   8  @   a   BOXARRAY_GET_BOX%I #   H8  \       BOXARRAY_MAXSIZE_I '   ¤8  V   a   BOXARRAY_MAXSIZE_I%BXA )   ú8  @   a   BOXARRAY_MAXSIZE_I%CHUNK #   :9  \       BOXARRAY_MAXSIZE_V '   9  V   a   BOXARRAY_MAXSIZE_V%BXA )   ì9     a   BOXARRAY_MAXSIZE_V%CHUNK     x:  W       BOXARRAY_GROW_N #   Ï:  V   a   BOXARRAY_GROW_N%BA "   %;  @   a   BOXARRAY_GROW_N%N    e;  a       BOXARRAY_BBOX !   Æ;  V   a   BOXARRAY_BBOX%BA $   <  {       BOXARRAY_VERIFY_DIM ,   <  @      BOXARRAY_VERIFY_DIM%PRESENT '   ×<  V   a   BOXARRAY_VERIFY_DIM%BA )   -=  @   a   BOXARRAY_VERIFY_DIM%STAT    m=  P       BOXARRAY_SORT !   ½=  V   a   BOXARRAY_SORT%BA "   >  [       BOXARRAY_NODALIZE %   n>  V   a   BOXARRAY_NODALIZE%BA (   Ä>     a   BOXARRAY_NODALIZE%NODAL (   P?  `       BOXARRAY_BOX_BOUNDARY_N ,   °?  V   a   BOXARRAY_BOX_BOUNDARY_N%BAO +   @  Q   a   BOXARRAY_BOX_BOUNDARY_N%BX *   W@  @   a   BOXARRAY_BOX_BOUNDARY_N%N $   @  `       BOXARRAY_BOUNDARY_N (   ÷@  V   a   BOXARRAY_BOUNDARY_N%BAO '   MA  V   a   BOXARRAY_BOUNDARY_N%BA &   £A  @   a   BOXARRAY_BOUNDARY_N%N    ãA  Y       BOXARRAY_DIFF "   <B  V   a   BOXARRAY_DIFF%BAO !   B  V   a   BOXARRAY_DIFF%BA 