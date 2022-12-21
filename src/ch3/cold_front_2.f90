program cold_front_2
    implicit none
    !integer :: n
    !real :: nhours
    real :: dt(8)

    dt = [6, 12, 18, 24, 30, 36, 42, 48]

    print*, cold_front_temperature(12., 24., 20., 960., dt)
  

    !do n = 6, 48, 6
    !    nhours = real(n)
    !    print *, 'Temperature after ', &
    !    nhours, ' hours is ', &
    !    cold_front_temperature(12., 24., 20., 960., nhours), ' degrees.'
    !end do

    contains
    
    pure elemental real function cold_front_temperature( &
      temp1, temp2, c, dx, dt) result(res)
      real, intent(in) :: temp1, temp2, c, dx, dt
      res = temp2 - c * (temp2 - temp1) / dx * dt
    end function cold_front_temperature

end program cold_front_2


    