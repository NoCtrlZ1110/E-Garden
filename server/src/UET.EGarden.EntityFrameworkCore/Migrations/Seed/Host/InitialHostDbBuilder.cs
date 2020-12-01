﻿using UET.EGarden.EntityFrameworkCore;

namespace UET.EGarden.Migrations.Seed.Host
{
    public class InitialHostDbBuilder
    {
        private readonly EGardenDbContext _context;

        public InitialHostDbBuilder(EGardenDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            new DefaultEditionCreator(_context).Create();
            new DefaultLanguagesCreator(_context).Create();
            new HostRoleAndUserCreator(_context).Create();
            new DefaultSettingsCreator(_context).Create();

            _context.SaveChanges();
        }
    }
}
