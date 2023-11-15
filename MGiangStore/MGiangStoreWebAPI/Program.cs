using BusinessObjects.Models;
using DataAccess.Repository.OrderDetails;
using DataAccess.Repository.Orders;
using DataAccess.Repository.Roles;
using Repositories.Accounts;
using Repositories.Categories;
using Repositories.Products;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<MGiangStoreContext>();
builder.Services.AddSingleton<ICategoryRepository, CategoryRepository>();
builder.Services.AddSingleton<IProductRepository, ProductRepository>();
builder.Services.AddSingleton<IAccountRepository, AccountRepository>();
builder.Services.AddSingleton<IOrderRepositoty, OrderRepository>();
builder.Services.AddSingleton<IOrderDetailsRepository, OrderDetailsRepository>();
builder.Services.AddSingleton<IRoleRepository, RoleRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
