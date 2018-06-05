#-------------DESCRIPCION DEL PROYECTO-------- 
cmake_minimum_required(VERSION 2.8.3)
project(two_scara_collaboration)

#-------------ENCONTRAR LOS PAQUETES DE CATKIN---------------
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
  actionlib_msgs
  actionlib
  trajectory_msgs
  gazebo_msgs
  sensor_msgs
)
# --> ESTAMOS TRABAJANDO EN GAZEBO Y ROS
#---- La caja de estados se comunica con actionlib

#---------------CARGAMOS LOS ARCHIVOS DE LAS CARPETAS---------

#---CONVERTIR MENSAJES A HEADERS
 add_message_files(
   FILES
   cylinder_blocks_poses.msg
   scara_upper_boundary.msg
 )

#---CONVERTIR SERVICIOS A HEADERS
 add_service_files(
   FILES
   kpkv_msg.srv
   pool_claim_msg.srv
   upper_boundary_change.srv
 )

#---CONVERTIR ACCIONES A HEADERS
 add_action_files(
   FILES
   scara_gripper.action
 )

#-------------------GENERAR LAS DEPENDENCIAS DE LOS MENSAJES---------
 generate_messages (
   DEPENDENCIES
   std_msgs
   actionlib_msgs
   trajectory_msgs
   gazebo_msgs
   sensor_msgs
 )

#----------------OTRA ORDEN DE BUILD PARA INCLUIR DIRECTORIOS----
include_directories(
  ${catkin_INCLUDE_DIRS}
)


#---------DECIRLE AL BUILD QUE CONSTRUYA EJECUTABLES EN C++
 add_executable(cylinder_blocks_spawner src/cylinder_blocks_spawner.cpp)
 add_executable(cylinder_blocks_poses_publisher src/cylinder_blocks_poses_publisher.cpp)
 add_executable(scara_gripper_action_server src/scara_gripper_action_server.cpp)
 add_executable(scara_joint_controller src/scara_joint_controller.cpp)
 add_executable(cylinder_active_pool src/cylinder_active_pool.cpp)
 add_executable(scara_upper_boundary_maintainer src/scara_upper_boundary_maintainer.cpp)
 add_executable(scara_left_motion_planner src/scara_left_motion_planner.cpp)
 add_executable(scara_right_motion_planner src/scara_right_motion_planner.cpp)

#--------AGREGA LAS DEPENDENCIAS A CADA EXECUTABLE-------------
add_dependencies(cylinder_blocks_spawner two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(cylinder_blocks_poses_publisher two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(scara_gripper_action_server two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(scara_joint_controller two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(cylinder_active_pool two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(scara_upper_boundary_maintainer two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(scara_left_motion_planner two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})
add_dependencies(scara_right_motion_planner two_scara_collaboration_generate_messages_cpp
	 ${catkin_EXPORTED_TARGETS})

#--------VINCULAR LAS LIBRERIAS A LOS EJECUTABLES---------------
 target_link_libraries(cylinder_blocks_spawner
  ${catkin_LIBRARIES}
)
 target_link_libraries(cylinder_blocks_poses_publisher
  ${catkin_LIBRARIES}
)
 target_link_libraries(scara_gripper_action_server
  ${catkin_LIBRARIES}
)
 target_link_libraries(scara_joint_controller
  ${catkin_LIBRARIES}
)
 target_link_libraries(cylinder_active_pool
  ${catkin_LIBRARIES}
)
 target_link_libraries(scara_upper_boundary_maintainer
  ${catkin_LIBRARIES}
)
 target_link_libraries(scara_left_motion_planner
  ${catkin_LIBRARIES}
)
 target_link_libraries(scara_right_motion_planner
  ${catkin_LIBRARIES}
)

