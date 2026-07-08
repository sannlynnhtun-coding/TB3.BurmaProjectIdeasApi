using Microsoft.AspNetCore.Mvc;

namespace MovieTicketOnlineBookingSystem.Api.Controllers;

public abstract class ReadOnlyControllerBase : ControllerBase
{
    protected ObjectResult ReadOnly()
    {
        return StatusCode(StatusCodes.Status405MethodNotAllowed, new
        {
            IsSuccess = false,
            Message = "Read-only JSON data source."
        });
    }
}
