
(cl:in-package :asdf)

(defsystem "ros_base_learning-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "robot_info" :depends-on ("_package_robot_info"))
    (:file "_package_robot_info" :depends-on ("_package"))
  ))