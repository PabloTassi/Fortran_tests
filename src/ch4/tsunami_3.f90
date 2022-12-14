program tsunami_3
    use iso_fortran_env, only: int32, real32
    use mod_diff, only: diff
    use mod_initial, only: set_gaussian
    implicit none

    integer(int32) :: n
    integer(int32), parameter :: grid_size = 100
    integer(int32), parameter :: num_time_steps = 100
    real(real32), parameter :: dt = 1, dx = 1, c = 1

    real(real32) :: h(grid_size)

    integer(int32), parameter :: icenter = 25
    real(real32), parameter :: decay = 0.02

    if (grid_size <= 0) stop 'grid_size must be > 0'
    if (dt <= 0) stop 'time step dt must be > 0'
    if (dx <= 0) stop 'grid spacing dx must be > 0'
    if (c <= 0) stop 'background flow speed c must be > 0'

    call set_gaussian(h, icenter, decay)

    print *, 0, h
    time_loop: do n = 1, num_time_steps
      h = h - c * diff(h) / dx * dt
      print *, n, h
    end do time_loop

end program tsunami_3