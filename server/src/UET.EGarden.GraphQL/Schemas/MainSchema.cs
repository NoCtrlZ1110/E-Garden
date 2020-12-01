using Abp.Dependency;
using GraphQL;
using GraphQL.Types;
using UET.EGarden.Queries.Container;

namespace UET.EGarden.Schemas
{
    public class MainSchema : Schema, ITransientDependency
    {
        public MainSchema(IDependencyResolver resolver) :
            base(resolver)
        {
            Query = resolver.Resolve<QueryContainer>();
        }
    }
}