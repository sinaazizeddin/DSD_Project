module Parking_management (
    input wire[4:0] current_hour,
    input wire car_entered,
    input wire is_uni_car_entered,
    input wire car_exited,
    input wire is_uni_car_exited,
    output reg[9:0] uni_parked_car,
    output reg[9:0] parked_car,
    output reg[9:0] uni_vacated_space,
    output reg[9:0] vacated_space,
    output reg uni_is_vacated_space,
    output reg is_vacated_space
);
reg[9:0] uni_space;
reg[9:0] space;
initial begin
    uni_parked_car = 0;
    parked_car = 0;
    uni_vacated_space = 500;
    vacated_space = 200;
    uni_is_vacated_space = 1;
    is_vacated_space = 1;
    uni_space = 500;
    space = 200;
end

always @(posedge car_entered or posedge car_exited) begin
    if (current_hour >= 8 && current_hour < 13) begin // update spaces
        uni_space = 500;
        space = 200;
    end if (current_hour >= 13) begin
        if (current_hour < 16) begin // update spaces
            uni_space = 1100 - current_hour * 50;
            space = 700 - uni_space;
        end if (current_hour >= 16) begin // update spaces
            uni_space = 200;
            space = 500;
        end
        if (uni_parked_car > uni_space) begin // uni -> free
            parked_car = parked_car + (uni_parked_car - uni_space);
            uni_parked_car = uni_space;
        end
    end
    uni_is_vacated_space = (uni_space != uni_parked_car) ? 1 : 0;
    is_vacated_space = (space != parked_car) ? 1 : 0;
    if (car_entered && current_hour >= 8) begin
        case(is_uni_car_entered)
            1: begin
                if (uni_is_vacated_space) uni_parked_car = uni_parked_car + 1;
                else if (is_vacated_space) parked_car = parked_car + 1;
            end
            0: begin
                if (is_vacated_space) parked_car = parked_car + 1;
            end
        endcase
    end if (car_exited && current_hour >= 8) begin
        case(is_uni_car_exited)
            1: begin
                if (uni_parked_car > 0) uni_parked_car = uni_parked_car - 1;
            end
            0: begin
                if (parked_car > 0) parked_car = parked_car - 1;
            end
        endcase
    end
    uni_vacated_space = uni_space - uni_parked_car;
    vacated_space = space - parked_car;
    uni_is_vacated_space = (uni_space != uni_parked_car) ? 1 : 0;
    is_vacated_space = (space != parked_car) ? 1 : 0;
end
endmodule
