; Auto-generated. Do not edit!


(cl:in-package ros_base_learning-msg)


;//! \htmlinclude robot_info.msg.html

(cl:defclass <robot_info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (age
    :reader age
    :initarg :age
    :type cl:fixnum
    :initform 0)
   (weight
    :reader weight
    :initarg :weight
    :type cl:fixnum
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass robot_info (<robot_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_base_learning-msg:<robot_info> is deprecated: use ros_base_learning-msg:robot_info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <robot_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_base_learning-msg:header-val is deprecated.  Use ros_base_learning-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <robot_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_base_learning-msg:name-val is deprecated.  Use ros_base_learning-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <robot_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_base_learning-msg:age-val is deprecated.  Use ros_base_learning-msg:age instead.")
  (age m))

(cl:ensure-generic-function 'weight-val :lambda-list '(m))
(cl:defmethod weight-val ((m <robot_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_base_learning-msg:weight-val is deprecated.  Use ros_base_learning-msg:weight instead.")
  (weight m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <robot_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_base_learning-msg:type-val is deprecated.  Use ros_base_learning-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<robot_info>)))
    "Constants for message type '<robot_info>"
  '((:UNKNOWN . 0)
    (:TYPE_1 . 1)
    (:TYPE_2 . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'robot_info)))
    "Constants for message type 'robot_info"
  '((:UNKNOWN . 0)
    (:TYPE_1 . 1)
    (:TYPE_2 . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_info>) ostream)
  "Serializes a message object of type '<robot_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'weight)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_info>) istream)
  "Deserializes a message object of type '<robot_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'weight)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_info>)))
  "Returns string type for a message object of type '<robot_info>"
  "ros_base_learning/robot_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_info)))
  "Returns string type for a message object of type 'robot_info"
  "ros_base_learning/robot_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_info>)))
  "Returns md5sum for a message object of type '<robot_info>"
  "31d8314c5e0b46c76b66dca87e5e7ef9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_info)))
  "Returns md5sum for a message object of type 'robot_info"
  "31d8314c5e0b46c76b66dca87e5e7ef9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_info>)))
  "Returns full string definition for message of type '<robot_info>"
  (cl:format cl:nil "# Robot info~%uint8 UNKNOWN = 0~%uint8 TYPE_1 = 1~%uint8 TYPE_2 = 2~%~%Header header~%string name~%uint8 age~%uint8 weight~%uint8 type~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_info)))
  "Returns full string definition for message of type 'robot_info"
  (cl:format cl:nil "# Robot info~%uint8 UNKNOWN = 0~%uint8 TYPE_1 = 1~%uint8 TYPE_2 = 2~%~%Header header~%string name~%uint8 age~%uint8 weight~%uint8 type~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'name))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_info>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_info
    (cl:cons ':header (header msg))
    (cl:cons ':name (name msg))
    (cl:cons ':age (age msg))
    (cl:cons ':weight (weight msg))
    (cl:cons ':type (type msg))
))
