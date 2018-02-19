#' Rdrags: High-dimensional feature selection via Dense Relevant Attribute Group Selector
#'
#' Rdrags implements the high-dimensional feature selection algorithm called
#' Dense Relevant Attribute Group Selector
#' by Yu, Ding and Loscalzo, KDD 2008
#'
#'
#' @section Rdrags functions:
#' Rdrags
#'
#' @docType package
#' @name Rdrags
NULL



#' Dense Relevant Attribute Group Selector
#'
#' @param   data    Data to process
#' @param   h       Bandwidth, will not be used when useKNN is TRUE.
#' @param   k       Neighborhood size for k-NN. Will only be used when useKNN is TRUE.
#' @param   lambda  Lambda, only used when KernelType is flat
#' @param   maxIter Maximum number of iterations
#' @param   eps     Stopping criterion for convergence.
#' @param   kernelType  Type of the kernel to be used, either "gaussian" or "flat"
#' @return  XXXXXXX
#' @examples
#'
#' @export



# public class DRAGSFeatureGroupSelector {
#
# 	RealMatrix data;
# 	Number[] classValues;
# 	Vector<Attribute> attributes;
# 	ExampleSet exampleSet;
# 	ExampleSet exampleSetBest;
# 	AttributeWeights weights;
# 	double h;
# 	int k;
# 	int n;
# 	int d;
# 	boolean findBandwidthFromKNN;
# 	double eps;
# 	int maxIterations;
# 	int maxFeatures;
# 	int kernelType;
# 	double lambda;
# 	DenseGroupFinder denseGroupFinder;
# 	Vector<Vector<Integer> > denseGroups;
# 	Vector<Tupel<Double, Integer> > relevanceValues;
# 	Vector<AttributeWeights>  groupWeights;


Rdrags = function (data, maxFeatures = 10, h = 0.0, k = 5, useKNN = TRUE, kernelType = "gaussian", eps = 1e-5, maxIter = 100, lambda = 0) {
    n = nrow(data)
    d = ncol(data)

    # make sure the data is all numerical

    # transpose and normalize data
    # data = MatrixUtils.createRealMatrix(n, d);
    # i = 0;
    # for (Attribute attribute: exampleSet.getAttributes()) {
    #     j = 0;
    #     for (Example example: exampleSet) {
    #         data.setEntry(i, j, example.getNumericalValue(attribute));
    #         j++;
    #     }
    #
    #     Number[] row = doubleToNumberArray(data.getRow(i));
    #     double mean = Statistics.calculateMean(row);
    #     double sd = Statistics.getStdDev(row);
    #     for (j = 0; j < d; j++) {
    #         data.setEntry(i, j, (row[j].doubleValue() - mean) / sd);
    #     }
    #
    #     i++;
    # }
    #
}


        #
		# // Store the label values in classValues after normalizing
		# // such that mean = 0 and standard deviation = 1
		# if (exampleSet.getAttributes().getLabel().isNumerical() == false) {
		# 	throw new OperatorException("Numerical label expected");
		# }

		# classValues = new Double[d];
		# j = 0;
		# for (Example example: exampleSet) {
		# 	classValues[j] = example.getNumericalValue(exampleSet.getAttributes().getLabel());
		# 	j++;
		# }

		# double mean = Statistics.calculateMean(classValues);
		# double sd = Statistics.getStdDev(classValues);
		# for (j = 0; j < d; j++) {
		# 	classValues[j] = (classValues[j].doubleValue() - mean) / sd;
		# }


# 		weights = new AttributeWeights(exampleSet);
# 		attributes = new Vector<Attribute>();
# 		for (Attribute attribute: exampleSet.getAttributes()) {
# 			weights.setWeight(attribute.getName(), 0.0);
# 			attributes.add(attribute);
# 		}
#
# 		this.maxFeatures = maxFeatures;
# 		eps = 1e-5;
# 		maxIterations = 100;
# 		h = 0.0;
# 		k = 5;
# 		findBandwidthFromKNN = true;
# 		kernelType = DenseGroupFinder.KERNEL_GAUSSIAN;
# 	}
#
#     # first do group selection
#     # only k or h will be used.
#     denseGroups = DenseGroupFinder (data, eps, maxIter, lambda, kernelType, k, h, useKNN)
#
#
# 		Vector<Boolean> featureSeen = new Vector<Boolean>();
# 		Vector<Boolean> featureBest = new Vector<Boolean>();
# 		Vector<Double> featureCorrelation = new Vector<Double>();
# 		for (int i = 0; i < n; i++) {
# 			featureSeen.add(false);
# 			featureBest.add(false);
# 			featureCorrelation.add(Statistics.getCorrelation(classValues, doubleToNumberArray(data.getRow(i))));
# 		}
#
# 		// relevanceValues stores the average relevance for each feature group,
# 		// along with the index of the feature group.
# 		relevanceValues = new Vector<Tupel<Double, Integer> >();
# 		int size = denseGroups.size();
# 		for (int i = 0; i < size; i++) {
# 			int groupSize = denseGroups.get(i).size();
# 			double totalCorrelation = 0.0;
#
# 			for (int j = 0; j < groupSize; j++) {
# 				int feature = denseGroups.get(i).get(j);
# 				totalCorrelation += featureCorrelation.get(feature);
# 			}
#
# 			if (groupSize > 0) {
# 				relevanceValues.add(new Tupel<Double, Integer >(totalCorrelation/(double)groupSize, i));
# 			}
# 		}
#
# 		// Sort the feature groups based on the average relevance
# 		Collections.sort(relevanceValues, Collections.reverseOrder());
#
# 		// For each feature group, obtain the feature with the maximum
# 		// relevance, and assign weights for all the features in the group
# 		int remainingFeatures = maxFeatures;
# 		groupWeights = new Vector<AttributeWeights>();
# 		size = relevanceValues.size();
# 		for (int i = 0; i < size; i++) {
# 			int featureGroup = relevanceValues.get(i).getSecond();
# 			int groupSize = denseGroups.get(featureGroup).size();
#
# 			int maxFeature = -1;
# 			for (int j = 0; j < groupSize; j++) {
# 				int feature = denseGroups.get(featureGroup).get(j);
# 				if (maxFeature == -1 || featureCorrelation.get(feature) > featureCorrelation.get(maxFeature)) {
# 					if (featureSeen.get(feature) == false) {
# 						maxFeature = feature;
# 					}
# 				}
# 			}
#
# 			if (maxFeature != -1 && remainingFeatures > 0) {
# 				featureBest.set(maxFeature, true);
# 				remainingFeatures--;
# 			}
#
# 			AttributeWeights groupWeight = new AttributeWeights(exampleSet);
# 			for (Attribute attribute: exampleSet.getAttributes()) {
# 				groupWeight.setWeight(attribute.getName(), 0.0);
# 			}
#
# 			for (int j = 0; j < groupSize; j++) {
# 				int feature = denseGroups.get(featureGroup).get(j);
# 				if (featureSeen.get(feature) == false) {
# 					if (featureBest.get(feature) == true) {
# 						weights.setWeight(attributes.get(feature).getName(), (size - i));
# 						groupWeight.setWeight(attributes.get(feature).getName(), 2.0);
# 					}
# 					else {
# 						groupWeight.setWeight(attributes.get(feature).getName(), 1.0);
# 					}
# 					featureSeen.set(feature, true);
# 				}
# 			}
#
# 			groupWeights.add(groupWeight);
# 			groupWeights.get(i).setSource("DRAGS - DenseGroup" + (i+1));
# 		}
#
# 		exampleSetBest = (ExampleSet) exampleSet.copy();
# 		for (int i = 0; i < n; i++) {
# 			if (featureBest.get(i) == false) {
# 				exampleSetBest.getAttributes().remove(attributes.get(i));
# 			}
# 		}
# 	}
#
#
# 	public ExampleSet getExampleSetBest() {
# 		return exampleSetBest;
# 	}
#
# 	public AttributeWeights getWeights() {
# 		return weights;
# 	}
#
# 	public IOObjectCollection<AttributeWeights> getGroupWeights() {
# 		return new IOObjectCollection<AttributeWeights>(groupWeights);
# 	}
#
# 	public static Number[] doubleToNumberArray(double[] doubleArray) {
# 		Number[] numberArray = new Double[doubleArray.length];
#
# 		for (int i = 0; i < doubleArray.length; i++) {
# 			numberArray[i] = doubleArray[i];
# 		}
#
# 		return numberArray;
# 	}
#
# 	@Override
# 	public String toString() {
# 		StringBuffer result = new StringBuffer();
#
# 		result.append(super.toString() + Tools.getLineSeparator() + Tools.getLineSeparator());
# 		result.append("Bandwidth h = " + denseGroupFinder.getBandwidth() + Tools.getLineSeparator());
# 		result.append("Number of dense feature groups: " + relevanceValues.size() + Tools.getLineSeparator());
# 		result.append("Dense feature groups in descending order of relevance:" + Tools.getLineSeparator());
#
# 		int size = relevanceValues.size();
# 		for (int i = 0; i < size; i++) {
# 			int featureGroup = relevanceValues.get(i).getSecond();
# 			int groupSize = denseGroups.get(featureGroup).size();
# 			result.append("Number of features in group " + i+1 + ": " + groupSize + Tools.getLineSeparator());
# 		}
#
# 		return result.toString();
# 	}
# }
