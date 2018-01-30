def elastic_RK4_2D(DF, F, Mat, nf, nx, ny, dx, dy, dt, order, r):

    # fourth order Runge-Kutta time-stepping
    import rate2d
    import numpy as np

    # intialize arrays for Runge-Kutta stages
    k1 = np.zeros((nx, ny, nf))
    k2 = np.zeros((nx, ny, nf))
    k3 = np.zeros((nx, ny, nf))
    k4 = np.zeros((nx, ny, nf))

    rate2d.elastic_rate2d(k1, F, Mat, nf, nx, ny, dx, dy, order, r)
    rate2d.elastic_rate2d(k2, F+0.5*dt*k1, Mat, nf, nx, ny, dx, dy, order, r)
    rate2d.elastic_rate2d(k3, F+0.5*dt*k2, Mat, nf, nx, ny, dx, dy, order, r)
    rate2d.elastic_rate2d(k4, F+dt*k3, Mat, nf, nx, ny, dx, dy, order, r)
    
    # update fields
    DF[:,:,:] = F + (dt/6.0)*(k1 + 2.0*k2 + 2.0*k3 + k4)
    
