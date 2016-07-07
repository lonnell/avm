#|
  This file is a part of foo project.
  Copyright (c) 2016 Masayuki Takagi (kamonama@gmail.com)
|#

(in-package :cl-user)
(defpackage foo.lang.compiler.cl.compile-type
  (:use :cl
        :foo)
  (:export :compile-type))
(in-package :foo.lang.compiler.cl.compile-type)


(defun compile-type (type)
  (cl-pattern:match type
    ('bool 'boolean)
    ('int 'fixnum)
    ('float 'single-float)
    ('double 'double-float)
    ((:vector _ _) (error "Not implemented."))
    ((:array type1)
     (cl-pattern:match type1
       ('int 'int-array)
       ('float 'float-array)
       ('double 'double-array)
       ((:vector 'int 2) 'int2-array)
       ((:vector 'int 3) 'int3-array)
       ((:vector 'int 4) 'int4-array)
       ((:vector 'float 2) 'float2-array)
       ((:vector 'float 3) 'float3-array)
       ((:vector 'float 4) 'float4-array)
       ((:vector 'double 2) 'double2-array)
       ((:vector 'double 3) 'double3-array)
       ((:vector 'double 4) 'double4-array)
       (_ (error "Must not be reached."))))
    (_ (error "Must not be reached."))))