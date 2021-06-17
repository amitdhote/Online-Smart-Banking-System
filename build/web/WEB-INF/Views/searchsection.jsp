<div class="row">
    <div class="col-5 mx-auto">
        <form>
            <div class="form-group">
                <div class="input-group">
                    <input type="search" pattern="[0-9]{6,6}"
                           style="letter-spacing: 0.1em;font-weight: bold" maxlength="6"
                           value="${param.accno}"
                           placeholder="Enter Account number to search"
                           class="form-control" name="accno">
                    <div class="input-group-append">
                        <span class="input-group-text p-0">
                            <button class="btn btn-primary rounded-0">Search</button>
                        </span>                
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>