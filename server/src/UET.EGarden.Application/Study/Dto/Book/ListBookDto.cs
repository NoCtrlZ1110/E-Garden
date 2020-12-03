using Abp.Application.Services.Dto;

namespace UET.EGarden.Study.Dto.Book
{
    public class ListBookDto : EntityDto<long>
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string BookColor { get; set; }
        public string BookImage { get; set; }
        public long Grade { get; set; }
        public long TotalWord { get; set; }
        public long TotalSentence { get; set; }
        public long TotalUnit { get; set; }
    }
}
