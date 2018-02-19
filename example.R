#
# Rdrags example
#   (c) 2014, Aydin Demircioglu
#
#
#
# This is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this software. If not, see <http://www.gnu.org/licenses/>.
#


library(datamicroarray)
data('alon', package = 'datamicroarray')

devtools::load_all(".")

# alon has dim 60, 2000
data = alon$x
DenseGroupFinder (data, k = 5)

#DenseGroupFinder = function (data, k = 3, h = 0, useKNN = TRUE, lambda = 0.0, maxIter = 100, eps = 1e-5, kernelType = "gaussian") {
