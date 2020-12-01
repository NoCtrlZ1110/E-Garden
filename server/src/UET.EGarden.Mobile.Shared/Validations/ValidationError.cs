﻿namespace tmss.Validations
{
    public class ValidationError
    {
        public string MemberName { get; set; }
        public string ErrorMessage { get; set; }

        public ValidationError(string memberName, string errorMessage)
        {
            MemberName = memberName;
            ErrorMessage = errorMessage;
        }
    }
}