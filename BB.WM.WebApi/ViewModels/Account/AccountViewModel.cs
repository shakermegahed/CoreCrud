﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Entities.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class AccountViewModel
    {
        public Guid? AccountId { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public AccountStatus Status { get; set; }
        public string AccountRole { get; set; }
    }
}
