"""
This app uses Python 3.12, numpy, and pandas to generate a set of data points and plot them on a graph.
"""

# import the required libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


"""
Create a function 'gendata' that generates a set of data points (x, f(x)) and returns them as a pandas data frame.
Arguments:
- 'x_range' is a tuple of two integers representing the range of x values to generate.
Returns:
- A pandas data frame with two columns, 'x' and 'y'.
Details:
- 'x' values are generated randomly between x_range[0] and x_range[1].
- 'y' values are generated as a non-linear function of x with excessive random noise: y = x ^ 1.5  + noise.
- The data frame is sorted by the 'x' values.
Example:
    gendata((1, 10))
    returns a data frame with 10 rows and two columns, 'x' and 'y'.
"""

def gendata(x_range):
    # generate random x values
    x = np.random.randint(x_range[0], x_range[1], 100)
    
    # generate y values with noise
    noise = np.random.normal(0, 10, 100)
    y = x ** 1.5 + noise
    
    # create a pandas data frame
    data = pd.DataFrame({'x': x, 'y': y})
    
    # sort the data frame by 'x' values
    data = data.sort_values(by='x')
    
    return data


"""
Create a function 'plotdata' that plots the data points from the data frame.
Arguments:
- 'data' is a pandas data frame with two columns, 'x' and 'y'.
Returns:
- None
Details:
- The data points are plotted as a scatter plot.
- The plot has a title 'Data Points', x-axis label 'x', and y-axis label 'f(x)'.
"""

def plotdata(data):
    # plot the data points
    plt.scatter(data['x'], data['y'])
    
    # add title and labels
    plt.title('Data Points')
    plt.xlabel('x')
    plt.ylabel('f(x)')
    
    # display the plot
    plt.show()



"""
Create a function 'main' that generates data points and plots them.
Arguments:
- None
Returns:
- None
Details:
- Generate data points using the 'gendata' function.
"""

def main():
    # generate data points
    data = gendata((1, 100))
    
    # plot the data points
    plotdata(data)

if __name__ == "__main__":
    main()

