# ------IF, ELSE STATEMENTS
score <- 90

if (score >= 90) {
  print('Grade: A')
} else{
  print('Not above 90: FAIL')
}

# ------ IF, ELSE IF, ELSE STATEMENTS
score <- 81
if (score >= 90) {
  print('Grade: A')
} else if (score >= 80) {
  print('Grade: B')
} else if (score >= 70) {
  print('Grade: C')
} else {
  print('Not above 70: You Failed')
}

# ------------NESTED IF, ELSE STATEMENT
score <- 93

if (score >= 90) {
  print('Grade: A')
} else if(score >= 80) {
  if (score >= 85) {
    print('Grade: B+')
  } else {print('Grade: B-')}
} else if (score >= 70) {
  if (score >= 75) {
    print('Grade: C+')
  } else {print('Grade: C-')}
} else {print('Not above 70: You have Failed :(')}

# Alternative for Coding Nested IF, ELSE Statements
if (score >= 90) {
  print('Grade: A')
} else if(score >= 80) {if (score >= 85) {
                        print('Grade: B+')
                        } else {print('Grade: B-')}
} else if (score >= 70) {if (score >= 75) {
                        print('Grade: C+')
                        } else {print('Grade: C-')}
} else {print('Not above 70: You have Failed :(')}


# ------------SWITCH STATEMENTS
grade <- 'F'

result <- switch(grade, 
       'A' = 'Excellent', # this is Key-Value pair
       'B' = 'Great',
       'C' = 'Good',
       'D' = 'Failed',
       'Unknown')

result

