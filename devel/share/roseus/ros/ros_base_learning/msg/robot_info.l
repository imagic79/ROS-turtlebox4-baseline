;; Auto-generated. Do not edit!


(when (boundp 'ros_base_learning::robot_info)
  (if (not (find-package "ROS_BASE_LEARNING"))
    (make-package "ROS_BASE_LEARNING"))
  (shadow 'robot_info (find-package "ROS_BASE_LEARNING")))
(unless (find-package "ROS_BASE_LEARNING::ROBOT_INFO")
  (make-package "ROS_BASE_LEARNING::ROBOT_INFO"))

(in-package "ROS")
;;//! \htmlinclude robot_info.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*UNKNOWN*" (find-package "ROS_BASE_LEARNING::ROBOT_INFO"))
(shadow '*UNKNOWN* (find-package "ROS_BASE_LEARNING::ROBOT_INFO"))
(defconstant ros_base_learning::robot_info::*UNKNOWN* 0)
(intern "*TYPE_1*" (find-package "ROS_BASE_LEARNING::ROBOT_INFO"))
(shadow '*TYPE_1* (find-package "ROS_BASE_LEARNING::ROBOT_INFO"))
(defconstant ros_base_learning::robot_info::*TYPE_1* 1)
(intern "*TYPE_2*" (find-package "ROS_BASE_LEARNING::ROBOT_INFO"))
(shadow '*TYPE_2* (find-package "ROS_BASE_LEARNING::ROBOT_INFO"))
(defconstant ros_base_learning::robot_info::*TYPE_2* 2)
(defclass ros_base_learning::robot_info
  :super ros::object
  :slots (_header _name _age _weight _type ))

(defmethod ros_base_learning::robot_info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:age __age) 0)
    ((:weight __weight) 0)
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _age (round __age))
   (setq _weight (round __weight))
   (setq _type (round __type))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; uint8 _age
    1
    ;; uint8 _weight
    1
    ;; uint8 _type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint8 _age
       (write-byte _age s)
     ;; uint8 _weight
       (write-byte _weight s)
     ;; uint8 _type
       (write-byte _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _age
     (setq _age (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _weight
     (setq _weight (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ros_base_learning::robot_info :md5sum-) "31d8314c5e0b46c76b66dca87e5e7ef9")
(setf (get ros_base_learning::robot_info :datatype-) "ros_base_learning/robot_info")
(setf (get ros_base_learning::robot_info :definition-)
      "# Robot info
uint8 UNKNOWN = 0
uint8 TYPE_1 = 1
uint8 TYPE_2 = 2

Header header
string name
uint8 age
uint8 weight
uint8 type
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :ros_base_learning/robot_info "31d8314c5e0b46c76b66dca87e5e7ef9")


