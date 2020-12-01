﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Abp.Application.Services.Dto;

namespace UET.EGarden.Editions.Dto
{
    public class UpdateEditionDto
    {
        [Required]
        public EditionEditDto Edition { get; set; }

        [Required]
        public List<NameValueDto> FeatureValues { get; set; }
    }
}