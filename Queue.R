library(ineq)
library(pdq)


t.end   <- 10^5 # duration of sim
t.clock <- 0    # sim time
Ta <- 1.3333    # interarrival period
Ts <- 1.0000    # service period
t1 <- 0         # time for next arrival
t2 <- t.end     # time for next departure
tn <- t.clock   # tmp var for last event time
tb <- 0         # tmp var for last busy-time start
n <- 0          # number in system
s <- 0          # cumulative number-time product
b <- 0          # total busy time
c <- 0          # total completions
qc <- 0         # plot instantaneous q size
tc <- 0         # plot time delta
plotSamples <- 100
set.seed(1)



while (t.clock < t.end) {
  if (t1 < t2) {      # arrival event
    t.clock <- t1
    s <- s + n * (t.clock - tn)  # delta time-weighted number in queue
    n <- n + 1
    if (t.clock < plotSamples) { 
      qc <- append(qc,n)
      tc <- append(tc,t.clock) 
    }
    tn <- t.clock
    t1 <- t.clock + rexp(1, 1/Ta)
    if(n == 1) { 
      tb <- t.clock
      t2 <- t.clock + rexp(1, 1/Ts)  # exponential  interarrival period
    }
  } else {            # departure event
    t.clock <- t2
    s <- s + n * (t.clock - tn)  # delta time-weighted number in queue
    n <- n - 1
    if (t.clock < plotSamples) { 
      qc <- append(qc,n)
      tc <- append(tc,t.clock)
    }
    tn <- t.clock
    c <- c + 1
    if (n > 0) { 
      t2 <- t.clock + rexp(1, 1/Ts)  # exponential  service period
    }
    else { 
      t2 <- t.end
      b <- b + t.clock - tb
    }
  }   
}


u <- b/t.clock       # utilization B/T
N <- s/t.clock       # mean queue length (see the Load Average notes)
x <- c/t.clock       # mean throughput C/T
r <- N/x             # mean residence time (from Little's law: Q = XR)
q <- sum(qc)/max(tc) # estimated queue length for plot
