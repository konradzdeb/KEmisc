#include <Rcpp.h>

// [[Rcpp::plugins(cpp11)]]

//' @title Guess Vector Type
//'
//' @description Function analyses content of a factor vector and attempts to
//'   guess the correct type.
//'
//' @param x A vector of factor class.
//'
//' @return A scalar string with class name.
//'
//' @section Acknowledgements:
//' The initial version of this function was posted and discussed on
//'   \href{https://stackoverflow.com/q/52943081/1655567}{StackOverflow}.
//'
//' @export
//'
// [[Rcpp::export]]
Rcpp::String guess_vector_type(Rcpp::IntegerVector x) {

    // Define counters for all types
    int num_doubles = 0;
    int num_integers = 0;
    int num_strings = 0;

    // Converted strings
    double converted_double;
    int converted_integer;


    // Get character vector with levels
    Rcpp::StringVector levels = x.attr("levels");
    // Get integer vector with values
    // Rcpp::String type = x.sexp_type();
    // Returns integer vector type
    // Use iterator: https://teuder.github.io/rcpp4everyone_en/280_iterator.html
    for(Rcpp::IntegerVector::iterator it = x.begin(); it != x.end(); ++it) {
        // Get [] for vector element
        int index = std::distance(x.begin(), it);
        // Get value of a specific vector element
        int element = x[index];
        // Convert to normal string
        std::string temp = Rcpp::as<std::string>(levels[element]);
        // Try converting to an integer
        try
        {
            converted_integer = std::stoi(temp);
        }
        catch(...)
        {
            // Try converting to a doubke
            try
            {
                // Convert to ineteges
                converted_double = std::stod(temp);
            }
            catch(...)
            {
                ++num_integers;
            }
            ++num_doubles;
        }
        ++num_strings;

    }

    // Get max value of three variables
    // https://stackoverflow.com/a/2233412/1655567
    int max_val;
    max_val = num_doubles > num_integers? (num_doubles > num_strings? num_doubles: num_strings): (num_integers > num_strings? num_integers: num_strings);

    // Create results storage
    Rcpp::String res;


    // Check which value is matching max val
    if (max_val == num_doubles) {
        // Most converted to doubles
        res = "double";

    } else if (max_val == num_integers) {
        res = "integer";
    } else {
        res = "character";
    }

    // Return results vector
    return res;
}
