#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
//  变量传参数
typedef struct data{
    float argvx0 = 0.0;
    float argvy0 = 0.0;
    float argvz0 = 0.0;
    float argvx1 = 0.0;
    float argvy1 = 0.0;
    float argvz1 = 0.0;
} Data;

Data data;

void chatterCallback(const geometry_msgs::Twist& msg)       //  接收器回调函数，打印显示
{
    ROS_INFO("Recieve data:\n");
    ROS_INFO("发布的线速度数据是：\n x=%.1f\n,y=%.1f\n,z=%.1f\n",msg.linear.x,msg.linear.y,msg.linear.z);
    data.argvx0 = msg.linear.x;
    data.argvy0 = msg.linear.y;
    data.argvz0 = msg.linear.z;
        
    ROS_INFO("发布的角速度数据是：\n x=%.1f\n,y=%.1f\n,z=%.1f\n",msg.angular.x,msg.angular.y,msg.angular.z);
    data.argvx1 = msg.angular.x;
    data.argvy1 = msg.angular.y;
    data.argvz1 = msg.angular.z;
}

/*
思路：
键盘传参给函数，处理后在传给运行节点
（函数包名一个，线速度x,角速度z），就将后面两个依次
赋值给线速度x和角速度z 
    1、导入包
    2、初始化ros节点
    3、初始化ros句柄
    4、创建接收方和回调函数
    5、创建发布方以及消息载体
    6、编写发布函数实现发布
*/
int main(int argc, char *argv[])
{
    int judge = 0;
    //方便打印中文
    setlocale(LC_ALL,"");
    //初始化ros节点
    ros::init(argc,argv,"turtle_manager");
    //初始化ros句柄
    ros::NodeHandle node;

    //创建接收方
    ros::Subscriber sub = node.subscribe("cmd_vel", 100, &chatterCallback);

    //创建发布方
    ros::Publisher message=node.advertise<geometry_msgs::Twist>("cmd_vel_cov",60);
    //创建消息载体
    geometry_msgs::Twist turtle;
    while (ros::ok())
    {    
        judge = 0;
        //修改线速度
        turtle.linear.x=0.0;
        if(data.argvx0 != 0.0){
            turtle.linear.x=data.argvx0*0.5;     //可以更改，目前按0.5比例缩小
            data.argvx0 = 0.0;
            judge = 1;
        }
        turtle.linear.y=0.0;
        if(data.argvy0 != 0.0){
            turtle.linear.x=data.argvy0*0.5;
            data.argvy0 = 0.0;
            judge = 1;
        }
        turtle.linear.z=0.0;
        if(data.argvz0 != 0.0){
            turtle.linear.x=data.argvz0*0.5;
            data.argvz0 = 0.0;
            judge = 1;
        }
        //修改角速度
        turtle.angular.x=0.0;
        if(data.argvx1 != 0.0){
            turtle.angular.z=data.argvx1*0.5;    //可以更改，目前按0.5比例缩小
            data.argvx1 = 0.0;
            judge = 1;
        }
        turtle.angular.y=0.0;
        if(data.argvy1 != 0.0){
            turtle.angular.z=data.argvy1*0.5;
            data.argvy1 = 0.0;
            judge = 1;
        }
        turtle.angular.z=0.0;
        if(data.argvz1 != 0.0){
            turtle.angular.z=data.argvz1*0.5;
            data.argvz1 = 0.0;
            judge = 1;
        }
        //发布速率
        ros::Rate rate(60);
        //等待上述初始化完成在发布
        ros::Duration(1).sleep();
        //发布数据
        message.publish(turtle);
        if(judge){
            ROS_INFO("Output data:\n");
            ROS_INFO("线速度数据是：\n x=%.1f\n,y=%.1f\n,z=%.1f\n",turtle.linear.x,turtle.linear.y,turtle.linear.z);
            ROS_INFO("角速度数据是：\n x=%.1f\n,y=%.1f\n,z=%.1f\n",turtle.angular.x,turtle.angular.y,turtle.angular.z);
        }
        //处理回调函数
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}
