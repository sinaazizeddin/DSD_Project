module TB;
reg[4:0] current_hour;
reg car_entered;
reg is_uni_car_entered;
reg car_exited;
reg is_uni_car_exited;
wire[9:0] uni_parked_car;
wire[9:0] parked_car;
wire[9:0] uni_vacated_space;
wire[9:0] vacated_space;
wire uni_is_vacated_space;
wire is_vacated_space;
integer i;
Parking_management manager (
    current_hour,
    car_entered,
    is_uni_car_entered,
    car_exited,
    is_uni_car_exited,
    uni_parked_car,
    parked_car,
    uni_vacated_space,
    vacated_space,
    uni_is_vacated_space,
    is_vacated_space
);
initial begin
    car_entered = 0; is_uni_car_entered = 0; car_exited = 0; is_uni_car_exited = 0;
    for(i = 0; i < 470; i = i + 1) begin
        current_hour = 8; car_entered = 1; is_uni_car_entered = 1; #10;
        car_entered = 0; is_uni_car_entered = 0; #10;
    end
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    

    current_hour = 10; car_entered = 1; is_uni_car_entered = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_entered = 0; is_uni_car_entered = 0; #10;

    current_hour = 11; car_exited = 1; is_uni_car_exited = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_exited = 0; is_uni_car_exited = 0; #10;

    current_hour = 13; car_entered = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_entered = 0; #10;

    current_hour = 14; car_entered = 1; is_uni_car_entered = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_entered = 0; is_uni_car_entered = 0; #10;

    current_hour = 15; car_entered = 1; is_uni_car_entered = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_entered = 0; is_uni_car_entered = 0; #10;

    current_hour = 16; car_exited = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_exited = 0; #10;

    current_hour = 16; car_exited = 1; is_uni_car_exited = 1; #10;
    $display("Current Hour: %0d, Uni Parked Car: %0d, Parked Car: %0d, Uni Vacated Space: %0d, Vacated Space: %0d, Uni Is Vacated Space: %0d, Is Vacated Space: %0d", current_hour, uni_parked_car, parked_car, uni_vacated_space, vacated_space, uni_is_vacated_space, is_vacated_space);
    car_exited = 0; is_uni_car_exited = 0;

    #20; $stop;
end
endmodule
