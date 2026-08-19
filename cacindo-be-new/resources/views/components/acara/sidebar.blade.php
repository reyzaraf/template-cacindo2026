<div class="deznav">
    <div class="deznav-scroll">
        <span class="add-menu-sidebar" {{-- data-toggle="modal" --}}
            {{-- data-target="#addOrderModalside" --}}>Admin CAC INDO</span>
        <ul class="metismenu" id="menu">
            @can('systems control')
                <li
                    class="{{ request()->routeIs(['admin.users.*', 'admin.permissions.*', 'admin.roles.*']) ? 'mm-active' : '' }}">
                    <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                        <i class="flaticon-381-networking"></i>
                        <span class="nav-text">System Settings</span>
                    </a>
                    <ul aria-expanded="false">
                        @can('users read')
                            <li class="{{ request()->routeIs('admin.users.index') ? 'mm-active' : '' }}">
                                <a href="{{ route('admin.users.index') }}"
                                    class="{{ request()->routeIs(['admin.users.index', 'admin.users.*']) ? 'mm-active' : '' }}">
                                    Users
                                </a>
                            </li>
                        @endcan
                        @can('permissions read')
                            <li class="{{ request()->routeIs('admin.permissions.index') ? 'mm-active' : '' }}">
                                <a href="{{ route('admin.permissions.index') }}"
                                    class="{{ request()->routeIs(['admin.permissions.index', 'admin.permissions.*']) ? 'mm-active' : '' }}">
                                    Permissions
                                </a>
                            </li>
                        @endcan
                        @can('roles read')
                            <li class="{{ request()->routeIs('admin.roles.index') ? 'mm-active' : '' }}">
                                <a href="{{ route('admin.roles.index') }}"
                                    class="{{ request()->routeIs(['admin.roles.index', 'admin.roles.*']) ? 'mm-active' : '' }}">
                                    Roles
                                </a>
                            </li>
                        @endcan
                    </ul>
                </li>
            @endcan
            <li
                class="{{ request()->routeIs(['admin.partners.*', 'admin.sliders.*', 'admin.sliders.*', 'admin.blogs.*', 'admin.events.*', 'admin.medias.*']) ? 'mm-active' : '' }}">
                <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                    <i class="flaticon-381-television"></i>
                    <span class="nav-text">Contents</span>
                </a>
                <ul aria-expanded="false">
                    @can('partners read')
                        <li>
                            <a href="{{ route('admin.partners.index') }}"
                                class="{{ request()->routeIs(['admin.partners.index', 'admin.partners.*']) ? 'mm-active' : '' }}">partners</a>
                        </li>
                    @endcan
                    @can('events read')
                        <li>
                            <a href="{{ route('admin.events.index') }}"
                                class="{{ request()->routeIs(['admin.events.index', 'admin.events.*']) ? 'mm-active' : '' }}">events</a>
                        </li>
                    @endcan
                    {{-- @can('programs read')
                    <li>
                        <a href="{{ route('admin.programs.index') }}"
                            class="{{ request()->routeIs(['admin.programs.index', 'admin.programs.*']) ? 'mm-active' : '' }}">programs</a>
                    </li>
                @endcan --}}
                    @can('medias read')
                        <li>
                            <a href="{{ route('admin.medias.index') }}"
                                class="{{ request()->routeIs(['admin.medias.index', 'admin.medias.*']) ? 'mm-active' : '' }}">medias</a>
                        </li>
                    @endcan
                    @can('pages read')
                        <li>
                            <a href="{{ route('admin.pages.index') }}"
                                class="{{ request()->routeIs(['admin.pages.index', 'admin.pages.*']) ? 'mm-active' : '' }}">pages</a>
                        </li>
                    @endcan
                    @can('sliders read')
                        <li>
                            <a href="{{ route('admin.sliders.index') }}"
                                class="{{ request()->routeIs(['admin.sliders.index', 'admin.sliders.*']) ? 'mm-active' : '' }}">sliders</a>
                        </li>
                    @endcan
                    @can('blogs read')
                        @if (Route::has('admin.blogs.index'))
                            <li>
                                <a href="{{ route('admin.blogs.index') }}"
                                    class="{{ request()->routeIs(['admin.blogs.index', 'admin.blogs.*']) ? 'mm-active' : '' }}">Blogs
                                    / News</a>
                            </li>
                        @endif
                    @endcan
                    
                </ul>
            </li>
           
        </ul>
        <div class="copyright">
            <p><strong>CAC INDO Admin Dashboard</strong> © 2023 All Rights Reserved</p>
            <p>Made with <span class="heart"></span> by DexignZone</p>
        </div>
    </div>
</div>
