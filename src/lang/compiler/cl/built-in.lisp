#|
  This file is a part of foo project.
  Copyright (c) 2016 Masayuki Takagi (kamonama@gmail.com)
|#

(in-package :cl-user)
(defpackage foo.lang.compiler.cl.built-in
  (:use :cl
        :foo
        :foo.lang.data
        :foo.lang.built-in)
  (:export))
(in-package :foo.lang.compiler.cl.built-in)


(defmethod built-in-functions ((engine (eql :cl)))
  '((+ (a a a)
     (((int int int) +)
      (((:vector int 2) (:vector int 2) (:vector int 2)) int2-add*)
      (((:vector int 3) (:vector int 3) (:vector int 3)) int3-add*)
      (((:vector int 4) (:vector int 4) (:vector int 4)) int4-add*)
      ((float float float) +)
      (((:vector float 2) (:vector float 2) (:vector float 2)) float2-add*)
      (((:vector float 3) (:vector float 3) (:vector float 3)) float3-add*)
      (((:vector float 4) (:vector float 4) (:vector float 4)) float4-add*)
      ((double double double) +)
      (((:vector double 2) (:vector double 2) (:vector double 2)) double2-add*)
      (((:vector double 3) (:vector double 3) (:vector double 3)) double3-add*)
      (((:vector double 4) (:vector double 4) (:vector double 4)) double4-add*)
      ))
    (- (a a a)
     (((int int int) -)
      (((:vector int 2) (:vector int 2) (:vector int 2)) int2-sub*)
      (((:vector int 3) (:vector int 3) (:vector int 3)) int3-sub*)
      (((:vector int 4) (:vector int 4) (:vector int 4)) int4-sub*)
      ((float float float) -)
      (((:vector float 2) (:vector float 2) (:vector float 2)) float2-sub*)
      (((:vector float 3) (:vector float 3) (:vector float 3)) float3-sub*)
      (((:vector float 4) (:vector float 4) (:vector float 4)) float4-sub*)
      ((double double double) -)
      (((:vector double 2) (:vector double 2) (:vector double 2)) double2-sub*)
      (((:vector double 3) (:vector double 3) (:vector double 3)) double3-sub*)
      (((:vector double 4) (:vector double 4) (:vector double 4)) double4-sub*)
      ))
    (* (a a a) (((int int int) *)
                ((float float float) *)
                ((double double double) *)))
    (/ (a a a) (((int int int) floor)
                ((float float float) /)
                ((double double double) /)))
    (*. ((:vector a b) a (:vector a b))
        ((((:vector int 2) int (:vector int 2)) int2-scale*)
         (((:vector int 3) int (:vector int 3)) int3-scale*)
         (((:vector int 4) int (:vector int 4)) int4-scale*)
         (((:vector float 2) float (:vector float 2)) float2-scale*)
         (((:vector float 3) float (:vector float 3)) float3-scale*)
         (((:vector float 4) float (:vector float 4)) float4-scale*)
         (((:vector double 2) double (:vector double 2)) double2-scale*)
         (((:vector double 3) double (:vector double 3)) double3-scale*)
         (((:vector double 4) double (:vector double 4)) double4-scale*)))
    (.* (a (:vector a b) (:vector a b))
        (((int (:vector int 2) (:vector int 2)) int2-%scale*)
         ((int (:vector int 3) (:vector int 3)) int3-%scale*)
         ((int (:vector int 4) (:vector int 4)) int4-%scale*)
         ((float (:vector float 2) (:vector float 2)) float2-%scale*)
         ((float (:vector float 3) (:vector float 3)) float3-%scale*)
         ((float (:vector float 4) (:vector float 4)) float4-%scale*)
         ((double (:vector double 2) (:vector double 2)) double2-%scale*)
         ((double (:vector double 3) (:vector double 3)) double3-%scale*)
         ((double (:vector double 4) (:vector double 4)) double4-%scale*)))
    (/. ((:vector a b) a (:vector a b))
        (;(((:vector int 2) int (:vector int 2)) int2-scale-recip*)
         ;(((:vector int 3) int (:vector int 3)) int3-scale-recip*)
         ;(((:vector int 4) int (:vector int 4)) int4-scale-recip*)
         (((:vector float 2) float (:vector float 2)) float2-scale-recip*)
         (((:vector float 3) float (:vector float 3)) float3-scale-recip*)
         (((:vector float 4) float (:vector float 4)) float4-scale-recip*)
         (((:vector double 2) double (:vector double 2)) double2-scale-recip*)
         (((:vector double 3) double (:vector double 3)) double3-scale-recip*)
         (((:vector double 4) double (:vector double 4)) double4-scale-recip*)))
    (< (a a bool) (((int int bool) <)
                   ((float float bool) <)
                   ((doublet double bool) <)))
    (> (a a bool) (((int int bool) >)
                   ((float float bool) >)
                   ((double double bool) >)))
    (int2 (int int (:vector int 2))
          (((int int (:vector int 2)) int2-values*)))
    (int3 (int int int (:vector int 3))
          (((int int int (:vector int 3)) int3-values*)))
    (int4 (int int int int (:vector int 4))
          (((int int int int (:vector int 4)) int4-values*)))
    (float2 (float float (:vector float 2))
            (((float float (:vector float 2)) float2-values*)))
    (float3 (float float float (:vector float 3))
            (((float float float (:vector float 3)) float3-values*)))
    (float4 (float float float float (:vector float 4))
            (((float float float float (:vector float 4)) float4-values*)))
    (double2 (double double (:vector double 2))
             (((double double (:vector double 2)) double2-values*)))
    (double3 (double double double (:vector double 3))
             (((double double double (:vector double 3)) double3-values*)))
    (double4 (double double double double (:vector double 4))
             (((double double double double (:vector double 4))
               double4-values*)))
    (int2-x ((:vector int 2) int)
            ((((:vector int 2) int) int2-x*)))
    (int2-y ((:vector int 2) int)
            ((((:vector int 2) int) int2-y*)))
    (int3-x ((:vector int 3) int)
            ((((:vector int 3) int) int3-x*)))
    (int3-y ((:vector int 3) int)
            ((((:vector int 3) int) int3-y*)))
    (int3-z ((:vector int 3) int)
            ((((:vector int 3) int) int3-z*)))
    (int4-x ((:vector int 4) int)
            ((((:vector int 4) int) int4-x*)))
    (int4-y ((:vector int 4) int)
            ((((:vector int 4) int) int4-y*)))
    (int4-z ((:vector int 4) int)
            ((((:vector int 4) int) int4-z*)))
    (int4-w ((:vector int 4) int)
            ((((:vector int 4) int) int4-w*)))
    (float2-x ((:vector float 2) float)
              ((((:vector float 2) float) float2-x*)))
    (float2-y ((:vector float 2) float)
              ((((:vector float 2) float) float2-y*)))
    (float3-x ((:vector float 3) float)
              ((((:vector float 3) float) float3-x*)))
    (float3-y ((:vector float 3) float)
              ((((:vector float 3) float) float3-y*)))
    (float3-z ((:vector float 3) float)
              ((((:vector float 3) float) float3-z*)))
    (float4-x ((:vector float 4) float)
              ((((:vector float 4) float) float4-x*)))
    (float4-y ((:vector float 4) float)
              ((((:vector float 4) float) float4-y*)))
    (float4-z ((:vector float 4) float)
              ((((:vector float 4) float) float4-z*)))
    (float4-w ((:vector float 4) float)
              ((((:vector float 4) float) float4-w*)))
    (double2-x ((:vector double 2) double)
               ((((:vector double 2) double) double2-x*)))
    (double2-y ((:vector double 2) double)
               ((((:vector double 2) double) double2-y*)))
    (double3-x ((:vector double 3) double)
               ((((:vector double 3) double) double3-x*)))
    (double3-y ((:vector double 3) double)
               ((((:vector double 3) double) double3-y*)))
    (double3-z ((:vector double 3) double)
               ((((:vector double 3) double) double3-z*)))
    (double4-x ((:vector double 4) double)
               ((((:vector double 4) double) double4-x*)))
    (double4-y ((:vector double 4) double)
               ((((:vector double 4) double) double4-y*)))
    (double4-z ((:vector double 4) double)
               ((((:vector double 4) double) double4-z*)))
    (double4-w ((:vector double 4) double)
               ((((:vector double 4) double) double4-w*)))
    (aref ((:array a) int a)
          ((((:array int) int int) aref)
           (((:array (:vector int 2)) int (:vector int 2)) int2-aref*)
           (((:array (:vector int 3)) int (:vector int 3)) int3-aref*)
           (((:array (:vector int 4)) int (:vector int 4)) int4-aref*)
           (((:array float) int float) aref)
           (((:array (:vector float 2)) int (:vector float 2)) float2-aref*)
           (((:array (:vector float 3)) int (:vector float 3)) float3-aref*)
           (((:array (:vector float 4)) int (:vector float 4)) float4-aref*)
           (((:array double) int double) aref)
           (((:array (:vector double 2)) int (:vector double 2)) double2-aref*)
           (((:array (:vector double 3)) int (:vector double 3)) double3-aref*)
           (((:array (:vector double 4)) int (:vector double 4)) double4-aref*)
           ))
    (norm ((:vector a _) a)
          (;(((:vector int 2) int) int2-norm*)
           ;(((:vector int 3) int) int3-norm*)
           ;(((:vector int 4) int) int4-norm*)
           (((:vector float 2) float) float2-norm*)
           (((:vector float 3) float) float3-norm*)
           (((:vector float 4) float) float4-norm*)
           (((:vector double 2) double) double2-norm*)
           (((:vector double 3) double) double3-norm*)
           (((:vector double 4) double) double4-norm*)))
    (mod (int int int) (((int int int) mod)))
    (coerce (a b) (((int float) int->float)
                   ((int double) int->double)
                   ((float double) float->double)))
    ))

(declaim (inline int->float))
(defun int->float (x)
  (float x 1.0))

(declaim (inline int->double))
(defun int->double (x)
  (float x 1.0d0))

(declaim (inline float->double))
(defun float->double (x)
  (float x 1.0d0))
