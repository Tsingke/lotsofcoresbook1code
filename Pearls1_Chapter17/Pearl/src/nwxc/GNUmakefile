# $Id: GNUmakefile 25513 2014-04-24 01:32:15Z d3y133 $

         LIBRARY = libnwxc.a

    OBJ_OPTIMIZE = nwxc_eval.o nwxc_x_att.o nwxc_x_b88.o nwxc_x_bnl.o \
                   nwxc_x_camb88.o nwxc_x_camlsd.o nwxc_x_campbe.o nwxc_x_camrpbe.o nwxc_x_cams12.o \
                   nwxc_x_dirac.o nwxc_x_gill.o nwxc_x_hse08.o nwxc_x_ft97.o nwxc_x_m05.o nwxc_x_m06.o \
                   nwxc_x_m11.o nwxc_x_opt.o nwxc_x_pbe.o nwxc_x_rpbe.o \
                   nwxc_x_pkzb99.o nwxc_x_s12.o nwxc_x_sogga.o nwxc_x_tpss03.o \
                   nwxc_x_wpbe.o nwxc_x_vs98.o nwxc_c_b95.o nwxc_c_ft97.o nwxc_c_lyp.o \
                   nwxc_c_m05.o nwxc_c_m06.o nwxc_c_m11.o nwxc_c_opt.o \
                   nwxc_c_p91.o nwxc_c_p91_vwn5.o nwxc_c_pw91lda.o nwxc_c_sogga.o \
                   nwxc_c_pbe.o nwxc_c_Mpbe.o nwxc_c_pkzb99.o nwxc_c_tpss03.o \
                   nwxc_c_vs98.o nwxc_c_lsda.o nwxc_c_vwn1.o \
                   nwxc_c_vwn1_rpa.o nwxc_c_vwn2.o nwxc_c_vwn3.o nwxc_c_vwn4.o \
                   nwxc_c_vwn5.o nwxc_c_op.o \
                   nwxc_vdw_main.o nwxc_vdw_e.o nwxc_vdw_der.o nwxc_vdw_hess.o \
                   nwxc_vdw_util.o nwxc_cs00.o nwxc_vdw3a.o nwxc_vdw3b.o nwxc_vdw3c.o \
		   nwxcP_xc_b97.o nwxc_x_b97.o nwxc_c_b97.o nwxc_xc_kt1.o \
                   nwxc_c_spbe.o nwxc_x_ssbD_1.o nwxc_c_perdew81.o \
		   nwxc_c_perdew86.o nwxc_x_pw91.o nwxc_x_pw6.o nwxc_x_b86b.o

             OBJ = nwxc_block.o nwxc_add.o nwxc_query.o nwxc_nwchem.o \
                   nwxc_vdw_init.o nwxc_vdw3d.o

         HEADERS = nwxc.fh nwxc_param.fh

     LIB_TARGETS = 

       TEST_LIBS = $(LIBRARY) $(LIBS) 

USES_BLAS =  nwxc_vdw_main.F nwxc_vdw_e.F nwxc_vdw_der.F nwxc_vdw_hess.F nwxc_vdw_util.F

include ../config/makefile.h
include ../config/makelib.h
