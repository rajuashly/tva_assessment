using BankingAdminApp.DataLayer.DBContext;
using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Helpers;
using BankingAdminApp.Repository;
using BankingAdminApp.Repository.Repositories;
using Microsoft.ApplicationInsights;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<DefaultDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
builder.Services.Configure<CryptoEngine.Secrets>(builder.Configuration.GetSection("Secrets"));
builder.Services.AddScoped<IPersonsRepository<Persons>, PersonsRepository>();
builder.Services.AddScoped<IAccountsRepository<Accounts>, AccountsRepository>();
builder.Services.AddScoped<ITransactionsRepository<Transactions>, TransactionsRepository>();
builder.Services.AddScoped<TelemetryClient>();

// Add services to the container.
builder.Services.AddControllersWithViews();
// The next three lines are for session state
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession();
builder.Services.AddHttpContextAccessor();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.Use(async (ctx, next) =>
{
    await next();

    if (ctx.Response.StatusCode == 404 && !ctx.Response.HasStarted)
    {
        //Re-execute the request so the user gets the error page
        string originalPath = ctx.Request.Path.Value;
        ctx.Items["originalPath"] = originalPath;
        ctx.Request.Path = "/error/404";
        await next();
    }
});
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
              name: "default",
              pattern: "{controller=Home}/{action=Index}/{id?}");
});

app.Run();


