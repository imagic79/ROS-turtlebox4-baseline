#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <iostream>
#include <geometry_msgs/Twist.h>
// #include "/opt/ros/melodic/include/costmap_2d/costmap_2d_ros.h"


typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;
typedef struct data{
    float argvx0 = 0.0;
    float argvy0 = 0.0;
    float argvz0 = 0.0;
    float argvx1 = 0.0;
    float argvy1 = 0.0;
    float argvz1 = 0.0;
} Data;


class ZCLUtils{
public :
    Data data;
    // ZCLUtils();
    void Init();
    void Loop();

private:
    ros::NodeHandle node;
    ros::Subscriber sub ;
    move_base_msgs::MoveBaseGoal goal;
    geometry_msgs::PoseStamped global_pose;
    void chatterCallback(const geometry_msgs::Twist& msg);     //  接收器回调函数，打印显示
};

void ZCLUtils::Init(){
    ROS_INFO("Initialization Succeeded!");
    sub = node.subscribe("/cmd_vel", 100, &ZCLUtils::chatterCallback,this);
}


void ZCLUtils::Loop(){
    MoveBaseClient ac("move_base", true);

    while(!ac.waitForServer( ros::Duration( 5.0 ) )){
        ROS_INFO("Waiting for the move_base action server to come up");
    }

    // if(!test.getRobotPose(global_pose)){
    //     ROS_ERROR("move_base cannot make a plan for you because it could not get the start pose of the robot");
    //     return false;
    // }
    // ROS_INFO("init %f  %f  %f", global_pose.pose.position.x, global_pose.pose.position.y, global_pose.pose.position.z);
    global_pose.pose.position.x = 0;
    global_pose.pose.position.y = 0;
    global_pose.pose.orientation.z = 0;
    global_pose.pose.orientation.w = 0.7;
    ros::Rate rate(60);

    while (1)
    {
        ros::spinOnce();
        if (data.argvx0 == 0 && data.argvy0 == 0 && data.argvz0 == 0 && data.argvx1 == 0 && data.argvy1 == 0 && data.argvz1 == 0)
        {
            sleep(5);
            ros::spinOnce();
            // ROS_INFO("test2");
            if (data.argvx0 == 0 && data.argvy0 == 0 && data.argvz0 == 0 && data.argvx1 == 0 && data.argvy1 == 0 && data.argvz1 == 0)
            {
                ROS_INFO("test3");
                // 第一个待发送的 目标点 在 map 坐标系下的坐标位置
                goal.target_pose.pose.position.x = global_pose.pose.position.x;
                goal.target_pose.pose.position.y = global_pose.pose.position.y;
                goal.target_pose.pose.orientation.z = global_pose.pose.orientation.z;
                goal.target_pose.pose.orientation.w = global_pose.pose.orientation.w;
                goal.target_pose.header.frame_id = "map";
                goal.target_pose.header.stamp = ros::Time::now();
                ac.sendGoal(goal);
                ROS_INFO("Send NO. %d Goal !!!", 0);
                ROS_INFO(" Init success!!! ");
                ac.waitForResult();
                if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                {
                    ROS_INFO("The NO. %d Goal achieved success !!!", 0 );
                    break ;
                }else{ROS_WARN("The NO. %d Goal Planning Failed for some reason", 0); }
            }
        }
        rate.sleep();
    }
}

void ZCLUtils::chatterCallback(const geometry_msgs::Twist& msg)       //  接收器回调函数，打印显示
    {
        ROS_INFO("Recieve data:\n");
        ROS_INFO("x=%.1f\ny=%.1f\nz=%.1f\n",msg.linear.x,msg.linear.y,msg.linear.z);
        data.argvx0 = msg.linear.x;
        data.argvy0 = msg.linear.y;
        data.argvz0 = msg.linear.z;

        ROS_INFO("x=%.1f\ny=%.1f\nz=%.1f\n",msg.angular.x,msg.angular.y,msg.angular.z);
        data.argvx1 = msg.angular.x;
        data.argvy1 = msg.angular.y;
        data.argvz1 = msg.angular.z;
    }

int main(int argc, char** argv ){
    ros::init(argc,argv,"send_goals_node");
    ZCLUtils test;
    test.Init();
    test.Loop();
    return 0;
  
}

