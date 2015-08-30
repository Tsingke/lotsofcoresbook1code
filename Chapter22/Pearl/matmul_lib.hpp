//------------------------------------------------------------------------------
//
//  PROGRAM: Matrix library include file (function prototypes)
//
//  HISTORY: Written by Tim Mattson, August 2010 
//           Modified by Simon McIntosh-Smith, September 2011
//           Modified by Tom Deakin and Simon McIntosh-Smith, October 2012
//           Updated to C++ Wrapper v1.2.6 by Tom Deakin, August 2013
//
//  LICENSE: This work is licensed under the Creative Commons
//           Attribution 4.0 International License.
//           To view a copy of this license, visit
//           http://creativecommons.org/licenses/by/4.0/
//           or send a letter to:
//              Creative Commons,
//              444 Castro Street, Suite 900,
//              Mountain View, California, 94041, USA.
//
//------------------------------------------------------------------------------

// Make idempotent
#ifndef __MATRIX_LIB_HDR
#define __MATRIX_LIB_HDR


//------------------------------------------------------------------------------
//
//  Function to compute the matrix product (sequential algorithm, dot producdt)
//
//------------------------------------------------------------------------------
void seq_mat_mul_sdot(int Mdim, int Ndim, int Pdim, std::vector<float> &A, std::vector<float> &B, std::vector<float> &C);

//------------------------------------------------------------------------------
//
//  Function to initialize the input matrices A and B
//
//------------------------------------------------------------------------------
void initmat(int Mdim, int Ndim, int Pdim, std::vector<float>& A, std::vector<float>& B, std::vector<float>& C);

//------------------------------------------------------------------------------
//
//  Function to set a matrix to zero 
//
//------------------------------------------------------------------------------
void zero_mat (int Ndim, int Mdim, std::vector<float> &C);

//------------------------------------------------------------------------------
//
//  Function to fill Btrans(Mdim,Pdim)  with transpose of B(Pdim,Mdim)
//
//------------------------------------------------------------------------------
void trans(int Pdim, int Mdim, std::vector<float>& B, std::vector<float>& Btrans);

//------------------------------------------------------------------------------
//
//  Function to compute errors of the product matrix
//
//------------------------------------------------------------------------------
float error(int Mdim, int Ndim, int Pdim, std::vector<float>& C);


//------------------------------------------------------------------------------
//
//  Function to analyze and output results 
//
//------------------------------------------------------------------------------
void results(int Mdim, int Ndim, int Pdim, std::vector<float>& C, double run_time);
    
#endif
