String? validateInput(String? value, String input) {
  if (value == null || value.isEmpty) {
    return 'The ${input} is required';
  } else if (value.length < 5) {
    return 'The ${input} must be at least 5 characters long';
  }

  return null;
}

String? validateInputNumber(String? value, String input) {
  if (value == null || value.isEmpty) {
    return 'The ${input} is required';
  }

  return null;
}
